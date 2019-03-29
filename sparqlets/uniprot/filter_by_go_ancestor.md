# 

## Parameters
* `arg1`
  * default: GO_0045202

## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT DISTINCT ?uniprot ?gene ?uniprot_label ?go ?go_label
WHERE {
    ?uniprot up:classifiedWith ?go ;
             # up:encodedBy/skos:prefLabel ?gene ;
	     rdfs:label ?uniprot_label .
    ?go rdfs:subClassOf* obo:{{arg1}} .
    ?go rdfs:label ?go_label
    VALUES (?uniprot) { $STDIN }
}


```
