(*functional-properties* '(rdf:type))

(*unique-variables* '())

(*query-functional-properties?* #f)

(*queried-properties* '())

(define-constraint  
  'read/write  "
PREFIX mu: <http://mu.semte.ch/vocabularies/core/>
PREFIX yds: <http://yourdatastories.eu/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX adms: <http://www.w3.org/ns/adms#>
PREFIX dbo: <http://dbpedia.org/ontology/>
PREFIX fao: <http://www.fao.org/countryprofiles/geoinfo/geopolitical/resource/>
PREFIX org: <http://www.w3.org/ns/org#>
PREFIX elodgeo: <http://linkedeconomy.org/geoOntology#>
PREFIX rov: <http://www.w3.org/ns/regorg#>
PREFIX geosparql: <http://www.opengis.net/ont/geosparql#>
PREFIX sf: <http://www.opengis.net/ont/sf#>
PREFIX pc: <http://purl.org/procurement/public-contracts#>
PREFIX gr: <http://purl.org/goodrelations/v1#>
PREFIX elod: <http://linkedeconomy.org/ontology#>
PREFIX vcard: <http://www.w3.org/2006/vcard/ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX dctype: <http://purl.org/dc/dcmitype/>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX dcat: <http://www.w3.org/ns/dcat#>
PREFIX rm: <http://mu.semte.ch/vocabularies/logical-delete/>
PREFIX typedLiterals: <http://mu.semte.ch/vocabularies/typed-literals/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX app: <http://mu.semte.ch/app/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

CONSTRUCT {
 ?a ?b ?c.
}
WHERE { 
 {
  GRAPH yds:uuids {
   ?a ?b ?c.
   FILTER (?b = mu:uuid)
  }
 }
 UNION {
  GRAPH <http://yourdatastories.eu/taxonomies/eurovoc> {
   ?a ?b ?c.
   FILTER (?b != mu:uuid)
   ?a rdf:type ?type.
   VALUES ?type { dcat:Dataset dcat:Distribution }
  }
 }
 UNION {
  GRAPH yds:taxonomies {
   ?a ?b ?c.
   FILTER (?b != mu:uuid)
   ?a rdf:type skos:Concept
  }
 }
 UNION {
  GRAPH yds:catalog {
   FILTER (?b != mu:uuid)
   ?a ?b ?c.
   ?a rdf:type ?type .
   VALUES ?type { dcat:Dataset dcat:Distribution foaf:Organization dcat:Catalog }
  }
 }
 UNION {
  GRAPH yds:countries { 
   FILTER (?b != mu:uuid)
   ?a ?b ?c.
   ?a rdf:type elod:Country
  }
 }
 UNION {
  GRAPH yds:WorldFactbook {
   FILTER (?b != mu:uuid)
   ?a ?b ?c.
   ?a rdf:type skos:Concept
  }
 }
 UNION {
  GRAPH yds:WDI {
   FILTER (?b != mu:uuid)
   ?a ?b ?c.
   ?a rdf:type ?type
   VALUES ?type { elod:Amount elod:NonFinancialIndicator elod:FinancialIndicator }
  }
 }
 UNION {
  GRAPH yds:HDI {
   FILTER (?b != mu:uuid)
   ?a ?b ?c.
   ?a rdf:type elod:NonFinancialIndicator
  }
 }
 UNION {
  GRAPH <http://yourdatastories.eu/ODA/NL> {
   FILTER (?b != mu:uuid)
   ?a ?b ?c.
   ?a rdf:type ?type
   VALUES ?type { elod:CommittedItem elod:DisbursedItem elod:Amount foaf:Organization elod:AidActivity }
  }
 }
 UNION {
  GRAPH <http://yourdatastories.eu/ODA/ZW> {
   FILTER (?b != mu:uuid)
   ?a ?b ?c.
   ?a rdf:type ?type
   VALUES ?type { elod:CommittedItem elod:DisbursedItem elod:Amount foaf:Organization elod:AidActivity }
  }
 }
 UNION {
  GRAPH <http://yourdatastories.eu/trade/NL> {
   FILTER (?b != mu:uuid)
   ?a ?b ?c.
   ?a rdf:type ?type
   VALUES ?type { elod:Amount elod:TradeActivity }
  }
 }
 UNION {
  GRAPH <http://yourdatastories.eu/trade/ZW> {
   FILTER (?b != mu:uuid)
   ?a ?b ?c.
   ?a rdf:type ?type
   VALUES ?type { elod:Amount elod:TradeActivity }
  }
 }
 UNION {
  GRAPH yds:tradeagents {
   FILTER (?b != mu:uuid)
   ?a ?b ?c.
   ?a rdf:type elod:GroupNationalAgent
  }
 }
 UNION {
  GRAPH yds:TEDUpdate {
   ?a ?b ?c.
   FILTER (?b != mu:uuid)
   ?a rdf:type ?type.
   VALUES ?type { pc:AwardCriteriaCombination pc:Contract pc:CriterionWeighting gr:UnitPriceSpecification vcard:Address foaf:Organization skos:Concept }
  }
 }
}  ")
