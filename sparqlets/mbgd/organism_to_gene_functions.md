# Cluster IDs for each gene of

## Parameters
* `arg1`
  * default: syn

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX mgfo: <http://purl.jp/bio/11/mgfo#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX org: <http://mbgd.genome.ad.jp/rdf/resource/organism/>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX dct: <http://purl.org/dc/terms/>

SELECT ?function ?color ?label (COUNT(?function) AS ?count)
WHERE {
    ?cluster a orth:OrthologGroup ;
          orth:inDataset mbgdr:default ;
          orth:member/orth:gene/orth:organism org:{{arg1}} ;
    	  mgfo:funcMBGD ?mbgd_func .
    ?mbgd_func
          rdfs:label ?label ;
          dct:identifier ?function ;
          mgfo:colorCode ?color .
}
ORDER BY DESC(?count)


```
