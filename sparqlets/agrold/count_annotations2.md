# 

## Parameters


## Endpoint
http://volvestre.cirad.fr:8890/sparql

## `result`

```sparql
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX agrold: <http://www.southgreen.fr/agrold/vocabulary/>

SELECT ?s ?annotation
WHERE {
    ?s agrold:has_annotation ?annotation ;
       a owl:Class .
}
ORDER BY ?s


```
