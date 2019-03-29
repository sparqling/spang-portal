# MBGD complete genomes in taxon

## Parameters


## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX taxid: <http://identifiers.org/taxonomy/>

SELECT ?genome mbgd:inTaxon ?taxon
WHERE {
    # ?genome a mbgd:CompleteGenome .
    ?genome a mbgd:DraftGenome .
    ?genome rdfs:seeAlso ?taxid .
    ?taxid rdfs:subClassOf* ?taxon . 
    FILTER (?taxon != taxid:1) # Omit the top level "root"
}


```
