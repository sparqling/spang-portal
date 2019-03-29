# 

## Parameters
* `arg1`
  * default: P00918

## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>

SELECT ?gene
?protein_label
?annot_comment
?disease_label
?disease_comment
WHERE {
    uniprot:{{arg1}} up:encodedBy/skos:prefLabel ?gene ;
	     rdfs:label ?protein_label ;
	     up:annotation ?annot .
    ?annot a up:Disease_Annotation ;
	     rdfs:comment ?annot_comment .
    OPTIONAL {
	?annot up:disease ?disease .
	?disease skos:prefLabel ?disease_label ;
	         rdfs:comment ?disease_comment .
    }
}


```
