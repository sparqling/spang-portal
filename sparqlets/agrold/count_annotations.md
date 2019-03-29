# 

## Parameters


## Endpoint
http://volvestre.cirad.fr:8890/sparql

## `result`

```sparql
PREFIX agrold: <http://www.southgreen.fr/agrold/vocabulary/>

SELECT ?type (COUNT(?s) AS ?count)
WHERE {
    ?s agrold:has_annotation ?annotation ;
       a ?type .
}
ORDER BY DESC(?count)


```
