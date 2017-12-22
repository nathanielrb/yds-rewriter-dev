(use s-sparql mu-chicken-support)

(define *domain-lisp-path*
  (config-param "RESOURCES_CONFIG_PATH" "/resources/domain.lisp"))

(define graphs
  '(<http://yourdatastories.eu/taxonomies/eurovoc>
    <http://yourdatastories.eu/ontology>
    <http://yourdatastories.eu/taxonomies>
    <http://yourdatastories.eu/catalog>
    <http://yourdatastories.eu/countries>
    <http://yourdatastories.eu/regions>
    <http://yourdatastories.eu/WorldFactbook>
    <http://yourdatastories.eu/WDI>
    <http://yourdatastories.eu/OpenCorporates>
    <http://yourdatastories.eu/regions>
    <http://yourdatastories.eu/HDI>
    <http://yourdatastories.eu/ODA/NL>
    <http://yourdatastories.eu/ODA/ZW>
    <http://yourdatastories.eu/ODA/RS> ; not necessary
    <http://yourdatastories.eu/trade> ; *
    <http://yourdatastories.eu/trade/NL> 
    <http://yourdatastories.eu/trade/ZW> 
    <http://yourdatastories.eu/transactions/NL> ; yes
    <http://yourdatastories.eu/tradeagents>  ;*
    <http://yourdatastories.eu/TEDUpdate> ; yes
    <http://yourdatastories.eu/TEDGreece> ;
    <http://yourdatastories.eu/NSRFAPI> ; yes
    <http://yourdatastories.eu/DiavgeiaUpdate>
    <http://yourdatastories.eu/galwayTraffic> )) 

(define namespaces
  '((mu "http://mu.semte.ch/vocabularies/core/") (adms "http://www.w3.org/ns/adms#") (dbo "http://dbpedia.org/ontology/") (fao "http://www.fao.org/countryprofiles/geoinfo/geopolitical/resource/") (org "http://www.w3.org/ns/org#") (elodgeo "http://linkedeconomy.org/geoOntology#") (rov "http://www.w3.org/ns/regorg#") (geosparql "http://www.opengis.net/ont/geosparql#") (sf "http://www.opengis.net/ont/sf#") (pc "http://purl.org/procurement/public-contracts#") (gr "http://purl.org/goodrelations/v1#") (elod "http://linkedeconomy.org/ontology#") (xsd "http://www.w3.org/2001/XMLSchema#") (vcard "http://www.w3.org/2006/vcard/ns#") (skos "http://www.w3.org/2004/02/skos/core#") (rdfs "http://www.w3.org/2000/01/rdf-schema#") (rdf "http://www.w3.org/1999/02/22-rdf-syntax-ns#") (foaf "http://xmlns.com/foaf/0.1/") (dctype "http://purl.org/dc/dcmitype/") (dct "http://purl.org/dc/terms/") (dcat "http://www.w3.org/ns/dcat#") (owl "http://www.w3.org/2002/07/owl#") (rewriter "http://mu.semte.ch/graphs/") (mu "http://mu.semte.ch/vocabularies/core/") (skos "http://www.w3.org/2004/02/skos/core#") (owl "http://www.w3.org/2002/07/owl#") (rdf "http://www.w3.org/1999/02/22-rdf-syntax-ns#") (dc "http://purl.org/dc/elements/1.1/") (foaf "http://xmlns.com/foaf/0.1/") (yds "http://yourdatastories.eu/")))

(define pattern (irregex ":class[[:whitespace:]]+[(]s-prefix[[:whitespace:]]+\"([^\"]+)\"[[:whitespace:]]*[)]" ))

(define (types-from-domain.lisp path)
  (with-input-from-file path
    (lambda ()
      (let ((file (read-string #f)))
        (delete-duplicates
         (map (lambda (match)
                (irregex-match-substring (irregex-match pattern match) 1))
              (irregex-extract pattern file)))))))

(define (get-graph-types graph)
  (let ((bindings (sparql-select
                   "SELECT DISTINCT ?type WHERE { GRAPH ~A { ?s a ?type } }" graph)))
    (if (null? bindings) '()
        (map cdr (join bindings)))))

(define types (map string->symbol (types-from-domain.lisp (*domain-lisp-path*))))


(define (block graph types)
  (let ((graph-types (lset-intersection rdf-equal? types (get-graph-types graph) )))
    (if (null? graph-types)
        '()
        `((GRAPH ,graph 
                 (?a ?b ?c)
                 (FILTER (!= ?b mu:uuid))
                 ,@(if (= (length graph-types) 1)
                       `((?a rdf:type ,(car graph-types)))
                       `((?a rdf:type ?type)
                         (VALUES ?type ,@graph-types))))))))

(define (query types)
  `(@QueryUnit
    (@Query
     (@Prologue
      ,@(map (lambda (pref) `(PREFIX ,(symbol-append (car pref) ':) ,(read-uri (cadr pref))))
             namespaces))
     (CONSTRUCT (?a ?b ?c))
     (WHERE
      (UNION
       ((GRAPH yds:uuids (?a ?b ?c) (FILTER (= ?b mu:uuid))))
       
       ,@(filter pair? (map (cut block <> types) graphs)))))))

(*functional-properties* '(rdf:type))

(*unique-variables* '())

(*query-functional-properties?* #f)

(*queried-properties* '())

(define (generate-constraint)
  (format (current-error-port) "~%Generating new constraint...")
  (parameterize ((*namespaces* namespaces)
                 (*print-queries?* #f))
    (let ((types (map string->symbol (types-from-domain.lisp (*domain-lisp-path*)))))
      (query types))))

(let ((q (generate-constraint)))
  (define-constraint 'read/write q)
  (format (current-error-port) "~%==Generated Constraint==~%~%~A~%" (write-sparql q)))

(define-rest-call 'POST '("constraint")
  (lambda (_)
    (let* ((q (generate-constraint))
           (qstr (write-sparql q)))
      (set! *read-constraint* (make-parameter q))
      (set! *write-constraint* (make-parameter q))
      (format (current-error-port) "~%==Regenerated Constraint==~%~%~A~%" qstr)
      `((success . "true")
        (constraint . ,qstr)))))
