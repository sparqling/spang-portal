# MBGD default organisms in a specific taxon

## Parameters


## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX tax: <http://purl.uniprot.org/taxonomy/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>

SELECT ?org
WHERE {
    mbgdr:default orth:organism ?org .
    ?org orth:taxon ?taxid .
    ?taxid rdfs:subClassOf* tax:$1 .
}


```
