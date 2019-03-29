# UniProt information

## Parameters
* `arg1`
  * default: P0C127

## Endpoint
http://volvestre.cirad.fr:8890/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>

SELECT ?p ?o ?label
WHERE {
    uniprot:{{arg1}} ?p ?o
    OPTIONAL {
	?o rdfs:label ?label
    }
}


```
