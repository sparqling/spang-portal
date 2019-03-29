# 

## Parameters


## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#stdin uniprot:P00918
SELECT ?uniprot ?gene
?protein_label
?annot_comment
?disease_label
?disease_comment
WHERE {
    ?uniprot up:encodedBy/skos:prefLabel ?gene ;
	     rdfs:label ?protein_label ;
	     up:annotation ?annot .
    ?annot a up:Disease_Annotation ;
	     rdfs:comment ?annot_comment .
    OPTIONAL {
	?annot up:disease ?disease .
	?disease skos:prefLabel ?disease_label ;
	         rdfs:comment ?disease_comment .
    }
    VALUES (?uniprot) { (uniprot:P00918) }
}


```
