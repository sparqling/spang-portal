# Free text search in Virtuoso

## Parameters


## Endpoint
http://dbpedia.org/sparql

## `result`

```sparql
SELECT ?class ?instance ?property ?text
WHERE {
    ?instance ?property ?text .
    ?instance a ?class .
    ?text bif:contains '"$1"' .
}
ORDER BY ?class ?instance ?text


```
