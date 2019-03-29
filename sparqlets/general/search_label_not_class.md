# Free text search in Virtuoso (count instances of each class)

## Parameters


## Endpoint
http://dbpedia.org/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?instance ?text
WHERE {
    ?instance rdfs:label ?text .
    ?text bif:contains '"$1"' .
    MINUS {
        ?instance a ?class .
    }
}
ORDER BY ?instance


```
