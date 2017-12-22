(*functional-properties* '())

(*unique-variables* '())

(*query-functional-properties?* #f)

(*queried-properties* '())

(define-constraint
  'read/write
  "PREFIX mu: <http://mu.semte.ch/vocabularies/core/>
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
  }
 }
}")
