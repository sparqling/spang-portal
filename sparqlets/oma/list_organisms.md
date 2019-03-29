# List available species

## Parameters


## Endpoint
https://sparql.omabrowser.org/sparql

## `result`

```sparql
PREFIX up: <http://purl.uniprot.org/core/>

SELECT * WHERE {
    ?taxid a up:Taxon ;
           up:scientificName ?name ;
           up:rank up:Species .
} 


```
