(*functional-properties* '(rdf:type))

(*unique-variables* '())

(*query-functional-properties?* #f)

(*queried-properties* '())

(define-constraint
  'read/write
  "PREFIX mu: <http://mu.semte.ch/vocabularies/core/>
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
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX vcard: <http://www.w3.org/2006/vcard/ns#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX dctype: <http://purl.org/dc/dcmitype/>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX dcat: <http://www.w3.org/ns/dcat#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rewriter: <http://mu.semte.ch/graphs/>
PREFIX mu: <http://mu.semte.ch/vocabularies/core/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX yds: <http://yourdatastories.eu/>

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
  GRAPH ?graph {
   ?a ?b ?c.
   FILTER (?b != mu:uuid)
   ?a rdf:type ?type.
  }
  VALUES (?graph ?type) {
     (<http://yourdatastories.eu/taxonomies/eurovoc> dcat:Dataset)
     (<http://yourdatastories.eu/taxonomies/eurovoc> dcat:Distribution)
     (<http://yourdatastories.eu/taxonomies/eurovoc> skos:Concept)
     (<http://yourdatastories.eu/taxonomies/eurovoc> skos:ConceptScheme)

     (<http://yourdatastories.eu/taxonomies> skos:Concept)
     (<http://yourdatastories.eu/taxonomies> skos:ConceptScheme)
     (<http://yourdatastories.eu/taxonomies> elod:OrganizationStatus)
     (<http://yourdatastories.eu/taxonomies> elod:OrganizationCategory)
     (<http://yourdatastories.eu/taxonomies> org:Role elod:OrganizationDomain)
     (<http://yourdatastories.eu/taxonomies> elod:OrganizationalUnitCategory)
     (<http://yourdatastories.eu/taxonomies> elod:VatType)

     (<http://yourdatastories.eu/catalog> dcat:Catalog)
     (<http://yourdatastories.eu/catalog>  dcat:Dataset)
     (<http://yourdatastories.eu/catalog>  dcat:Distribution)
     (<http://yourdatastories.eu/catalog>  foaf:Organization)

     (<http://yourdatastories.eu/countries> skos:Concept)
     (<http://yourdatastories.eu/countries> skos:ConceptScheme)
     (<http://yourdatastories.eu/countries> elod:Country)

     (<http://yourdatastories.eu/regions> skos:Concept) 
     (<http://yourdatastories.eu/regions> skos:ConceptScheme)

     (<http://yourdatastories.eu/WorldFactbook> skos:Concept)
     (<http://yourdatastories.eu/WorldFactbook> skos:ConceptScheme)

     (<http://yourdatastories.eu/WDI> elod:Amount)
     (<http://yourdatastories.eu/WDI>  elod:FinancialIndicator)
     (<http://yourdatastories.eu/WDI>  elod:NonFinancialIndicator)

     (<http://yourdatastories.eu/OpenCorporates> rov:RegisteredOrganization)

     (<http://yourdatastories.eu/HDI> elod:NonFinancialIndicator)

     (<http://yourdatastories.eu/ODA/NL> elod:AidActivity)
     (<http://yourdatastories.eu/ODA/NL>  foaf:Organization)
     (<http://yourdatastories.eu/ODA/NL>  elod:Amount)
     (<http://yourdatastories.eu/ODA/NL>  elod:CommittedItem)
     (<http://yourdatastories.eu/ODA/NL>  rov:RegisteredOrganization)
     (<http://yourdatastories.eu/ODA/NL>  gr:BusinessEntity)
     (<http://yourdatastories.eu/ODA/NL>  elod:DisbursedItem)

     (<http://yourdatastories.eu/ODA/ZW>  elod:AidActivity)
     (<http://yourdatastories.eu/ODA/ZW>  foaf:Organization)
     (<http://yourdatastories.eu/ODA/ZW>  elod:Amount)
     (<http://yourdatastories.eu/ODA/ZW>  elod:CommittedItem)
     (<http://yourdatastories.eu/ODA/ZW>  rov:RegisteredOrganization)
     (<http://yourdatastories.eu/ODA/ZW>  gr:BusinessEntity)
     (<http://yourdatastories.eu/ODA/ZW>  elod:DisbursedItem)

     (<http://yourdatastories.eu/ODA/RS> elod:AidActivity)
     (<http://yourdatastories.eu/ODA/RS>  foaf:Organization)
     (<http://yourdatastories.eu/ODA/RS>  elod:Amount)
     (<http://yourdatastories.eu/ODA/RS>  elod:CommittedItem)
     (<http://yourdatastories.eu/ODA/RS>  rov:RegisteredOrganization)
     (<http://yourdatastories.eu/ODA/RS>  gr:BusinessEntity)
     (<http://yourdatastories.eu/ODA/RS>  elod:DisbursedItem)

     (<http://yourdatastories.eu/trade> elod:Amount)
     (<http://yourdatastories.eu/trade> elod:TradeActivity)

     (<http://yourdatastories.eu/trade/NL>  elod:Amount) 
     (<http://yourdatastories.eu/trade/NL>  elod:TradeActivity)

     (<http://yourdatastories.eu/trade/ZW>  elod:Amount)
     (<http://yourdatastories.eu/trade/ZW>  elod:TradeActivity)

     (<http://yourdatastories.eu/transactions/NL> elod:AidActivity)
     (<http://yourdatastories.eu/transactions/NL> elod:Amount)
     (<http://yourdatastories.eu/transactions/NL>  elod:Transaction)

     (<http://yourdatastories.eu/tradeagents>  elod:GroupNationalAgent)

     (<http://yourdatastories.eu/TEDUpdate>  skos:Concept)
     (<http://yourdatastories.eu/TEDUpdate>  foaf:Organization)
     (<http://yourdatastories.eu/TEDUpdate>   gr:UnitPriceSpecification)
     (<http://yourdatastories.eu/TEDUpdate>   vcard:Address)
     (<http://yourdatastories.eu/TEDUpdate>   pc:Contract)
     (<http://yourdatastories.eu/TEDUpdate>   pc:AwardCriteriaCombination)
     (<http://yourdatastories.eu/TEDUpdate>   pc:CriterionWeighting)
     (<http://yourdatastories.eu/TEDUpdate>   rov:RegisteredOrganization)
     (<http://yourdatastories.eu/TEDUpdate>   gr:BusinessEntity)

     (<http://yourdatastories.eu/TEDGreece> skos:Concept)
     (<http://yourdatastories.eu/TEDGreece> foaf:Organization)
     (<http://yourdatastories.eu/TEDGreece> gr:UnitPriceSpecification)
     (<http://yourdatastories.eu/TEDGreece> vcard:Address)
     (<http://yourdatastories.eu/TEDGreece> pc:Contract)
     (<http://yourdatastories.eu/TEDGreece> pc:AwardCriteriaCombination)
     (<http://yourdatastories.eu/TEDGreece> pc:CriterionWeighting)
     (<http://yourdatastories.eu/TEDGreece> rov:RegisteredOrganization)
     (<http://yourdatastories.eu/TEDGreece> gr:BusinessEntity)

     (<http://yourdatastories.eu/NSRFAPI> foaf:Organization)
     (<http://yourdatastories.eu/NSRFAPI>  elod:PublicProject)
     (<http://yourdatastories.eu/NSRFAPI>  elod:BudgetItem)
     (<http://yourdatastories.eu/NSRFAPI>  gr:UnitPriceSpecification)
     (<http://yourdatastories.eu/NSRFAPI>  vcard:Address)
     (<http://yourdatastories.eu/NSRFAPI>  pc:Contract)
     (<http://yourdatastories.eu/NSRFAPI>  rov:RegisteredOrganization)
     (<http://yourdatastories.eu/NSRFAPI>  gr:BusinessEntity)
     (<http://yourdatastories.eu/NSRFAPI>  geosparql:Feature)
     (<http://yourdatastories.eu/NSRFAPI>  geosparql:Geometry)
     (<http://yourdatastories.eu/NSRFAPI>  elod:Aggregate)

     (<http://yourdatastories.eu/DiavgeiaUpdate> foaf:Organization)
     (<http://yourdatastories.eu/DiavgeiaUpdate>  elod:SpendingItem)
     (<http://yourdatastories.eu/DiavgeiaUpdate>  elod:ExpenditureLine)
     (<http://yourdatastories.eu/DiavgeiaUpdate>  gr:UnitPriceSpecification)
     (<http://yourdatastories.eu/DiavgeiaUpdate>  elod:KAE elod:ExpenseApprovalItem)
     (<http://yourdatastories.eu/DiavgeiaUpdate>  elod:FinancialDecision)
     (<http://yourdatastories.eu/DiavgeiaUpdate>  elod:CommittedItem)
     (<http://yourdatastories.eu/DiavgeiaUpdate>  pc:Contract)
     (<http://yourdatastories.eu/DiavgeiaUpdate>  elod:Decision)
     (<http://yourdatastories.eu/DiavgeiaUpdate>  elod:NonFinancialDecision)
     (<http://yourdatastories.eu/DiavgeiaUpdate>  pc:AwardCriteriaCombination)
     (<http://yourdatastories.eu/DiavgeiaUpdate>  pc:CriterionWeighting)
     (<http://yourdatastories.eu/DiavgeiaUpdate>  rov:RegisteredOrganization)
     (<http://yourdatastories.eu/DiavgeiaUpdate>  gr:BusinessEntity)
     (<http://yourdatastories.eu/DiavgeiaUpdate>  foaf:Person)
     (<http://yourdatastories.eu/DiavgeiaUpdate>  elod:Attachment)
  }
 }
}")
