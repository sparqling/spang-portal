# Basic information of cluster

## Parameters
* `arg1`
  * default: 2000

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>

SELECT ?label ?description ?member_count ?page
WHERE {
    ?cluster a orth:OrthologGroup ;
             orth:inDataset mbgdr:default ;
             dct:identifier "{{arg1}}";
             rdfs:label ?label ;
             dct:description ?description ;
             mbgd:memberCount ?member_count ;
             foaf:page ?page .
}


```
