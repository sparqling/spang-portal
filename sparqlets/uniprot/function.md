# Function annotation

## Parameters
* `arg1`
  * default: K9Z723

## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>

SELECT ?function
WHERE {
   uniprot:{{arg1}} up:annotation ?annot .
   ?annot a up:Function_Annotation ;
   	  rdfs:comment ?function .
}


```
