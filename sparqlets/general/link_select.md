# Links from a specific instance

## Parameters


## Endpoint
http://dbpedia.org/sparql

## `result`

```sparql
SELECT ?s ?p ?o
WHERE {
    { $1 ?p ?o }
    UNION
    { ?s ?p $1 }
}


```
