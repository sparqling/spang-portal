# 

## Parameters
* `arg1`
  * default: K9Z723

## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX up: <http://purl.uniprot.org/core/>

SELECT ?protein ?gene ?function
WHERE {
    uniprot:{{arg1}} rdfs:label ?protein ;
               up:encodedBy/skos:prefLabel ?gene ;
    	       up:annotation ?annot .
   ?annot a up:Function_Annotation ;
   	  rdfs:comment ?function .
}


```
