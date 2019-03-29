# Count triples for each graph

## Parameters


## Endpoint
http://volvestre.cirad.fr:8890/sparql

## `result`

```sparql
SELECT ?graph (COUNT(?graph) AS ?triples)
WHERE {
    GRAPH ?graph {
        ?s ?p ?o .
    }
}
GROUP BY ?graph
ORDER BY DESC(?triples)


```
