# Get UniProt annotations

## Parameters
* `arg1`
  * default: P02649

## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>

SELECT ?gene ?organism ?function
WHERE {
    uniprot:{{arg1}} up:encodedBy/skos:prefLabel ?gene ;
               up:organism/up:scientificName ?organism ;
               up:annotation ?annot .
    ?annot a up:Function_Annotation ;
   	  rdfs:comment ?function .
}


```
