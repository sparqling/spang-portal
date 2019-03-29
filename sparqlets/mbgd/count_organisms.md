# MBGD default organisms (count)

## Parameters


## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX up: <http://purl.uniprot.org/core/>

SELECT ?superkingdom (COUNT(?organism) AS ?count)
WHERE {
    mbgdr:default orth:organism ?organism .
    ?organism orth:taxon ?taxid .
    ?taxid rdfs:subClassOf* ?super .
    ?super up:rank up:Superkingdom ;
           up:scientificName ?superkingdom .
}


```
