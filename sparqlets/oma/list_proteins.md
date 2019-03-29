# List proteins of a specific organism

## Parameters


## Endpoint
https://sparql.omabrowser.org/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX oo: <http://purl.org/net/orth#>

SELECT ?protein ?OMA_link
WHERE {
    ?protein a oo:Protein ;
             oo:organism ?organism ;
             rdfs:seeAlso ?OMA_link .
    ?organism ?inTaxon ?taxid .
    ?inTaxon rdfs:label 'in taxon'@en.
    ?taxid up:scientificName 'Rattus norvegicus'.
}


```
