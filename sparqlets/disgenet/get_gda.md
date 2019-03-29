# Get specific type of gene-disease association

## Parameters
* `arg1`
  * default: SIO_001120* `arg2`
  * default: 10

## Endpoint
http://rdf.disgenet.org/sparql/

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX void: <http://rdfs.org/ns/void#>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX dct: <http://purl.org/dc/terms/>

SELECT DISTINCT ?title ?dataset
WHERE {
    ?gda a sio:{{arg1}} ;
	 dct:identifier ?id ;
	 dct:title ?title ;
         rdfs:label ?label ;
	 rdfs:comment ?comment ;
	 void:inDataset ?dataset .
}
LIMIT {{arg2}}


```
