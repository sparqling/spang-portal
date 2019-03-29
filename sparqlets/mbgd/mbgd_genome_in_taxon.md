# MBGD complete genomes in taxon

## Parameters


## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX orth: <http://purl.jp/bio/11/orth#>

SELECT ?genome mbgd:inTaxon ?taxon
WHERE {
    ?genome a mbgd:CompleteGenome .
    ?genome orth:taxon ?taxid .
    ?taxid rdfs:subClassOf* ?taxon . 
}


```
