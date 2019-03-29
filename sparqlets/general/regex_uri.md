# Regex search for URIs (subjects of triples)

## Parameters


## Endpoint
http://dbpedia.org/sparql

## `result`

```sparql
SELECT DISTINCT ?resource
WHERE {
    ?resource ?p ?o .
    FILTER (regex(str(?resource), "$1", "i"))
}
ORDER BY ?resource


```
