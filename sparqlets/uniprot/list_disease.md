# 

## Parameters


## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX up: <http://purl.uniprot.org/core/>

SELECT ?protein ?gene
?protein_label
?disease_label
?disease_comment
?annot_comment
WHERE {
    ?protein up:encodedBy/skos:prefLabel ?gene ;
	     rdfs:label ?protein_label ;
	     up:annotation ?annot .
    ?annot a up:Disease_Annotation ;
	     rdfs:comment ?annot_comment ;
	     up:disease ?disease .
    ?disease skos:prefLabel ?disease_label ;
             rdfs:comment ?disease_comment .
}


```
