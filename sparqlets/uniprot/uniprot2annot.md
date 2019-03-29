# ?organism

## Parameters


## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#stdin uniprot:K9Z723
SELECT ?uniprot ?gene ?protein_label
?function
WHERE {
    ?uniprot up:encodedBy/skos:prefLabel ?gene ;
               # up:organism/up:scientificName ?organism ;
             rdfs:label ?protein_label ;
             up:annotation ?annot .
    ?annot a up:Function_Annotation ;
   	  rdfs:comment ?function .
    VALUES (?uniprot) { (uniprot:K9Z723) }
}


```
