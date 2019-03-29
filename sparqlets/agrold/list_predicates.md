# List predicates in a graph

## Parameters
* `arg1`
  * default: gramene.genes

## Endpoint
http://volvestre.cirad.fr:8890/sparql

## `result`

```sparql
SELECT ?p count(?p) as ?count
WHERE {
    GRAPH <http://www.southgreen.fr/agrold/{{arg1}}> {
	?s ?p ?o .
    }
}
ORDER BY DESC(?count)


```
