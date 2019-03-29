# Free text search in Virtuoso (count instances of each class)

## Parameters
* `arg1`
  * default: okazaki

## Endpoint
http://dbpedia.org/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>

SELECT ?class (COUNT(DISTINCT ?instance) AS ?count)
WHERE {
    ?instance rdfs:label ?text .
    ?text bif:contains '"{{arg1}}"' .
    ?instance a ?class .
    ?class rdfs:subClassOf+ owl:Thing .
}
ORDER BY DESC(?count)


```
