# Free text search in Virtuoso

## Parameters


## Endpoint
http://dbpedia.org/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?class ?instance ?text
WHERE {
    ?instance rdfs:label ?text .
    ?instance a ?class .
    ?text bif:contains '"$1"' .
}
ORDER BY ?class ?instance ?text


```
