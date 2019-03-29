# Get proteins having specific label

## Parameters
* `arg1`
  * default: INS

## Endpoint
https://sparql.omabrowser.org/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX oo: <http://purl.org/net/orth#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX up: <http://purl.uniprot.org/core/>

PREFIX lscr: <http://purl.org/lscr#>
SELECT *
WHERE {
    ?proteinOMA a oo:Protein ;
        oo:organism/obo:RO_0002162/up:scientificName ?species ;
        rdfs:label '{{arg1}}' .
    ?proteinOMA lscr:xrefUniprot ?UniProt_URI .
}


```
