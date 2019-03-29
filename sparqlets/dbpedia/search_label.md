# Free text search in Virtuoso (count instances of each class)

## Parameters
* `arg1`
  * default: okazaki

## Endpoint
http://dbpedia.org/sparql

## `result`

```sparql
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT DISTINCT ?class ?instance ?label
WHERE {
    ?instance rdfs:label ?label .
    ?instance a ?class .
    ?class rdfs:subClassOf+ owl:Thing .
    ?label bif:contains '"{{arg1}}"' .
}
ORDER BY ?class ?instance ?label


```
