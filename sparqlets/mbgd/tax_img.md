# 

## Parameters


## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>

SELECT ?org ?tax ?img
WHERE {
    ?org orth:taxon ?tax ;
         a mbgd:CompleteGenome .
    ?tax a up:Taxon ;
         foaf:depiction ?img .
}


```
