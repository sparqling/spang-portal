# 

## Parameters


## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

#stdin uniprot:P00918
SELECT ?uniprot ?gene
?protein_label
?disease_label
WHERE {
    ?uniprot up:encodedBy/skos:prefLabel ?gene ;
	     rdfs:label ?protein_label ;
	     up:annotation ?annot .
    ?annot a up:Disease_Annotation ;
             up:disease ?disease .
    ?disease skos:prefLabel ?disease_label .
    VALUES (?uniprot) { (uniprot:P00918) }
}


```
