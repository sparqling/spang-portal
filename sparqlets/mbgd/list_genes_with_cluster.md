# Cluster IDs for each gene of

## Parameters
* `arg1`
  * default: syn

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX org: <http://mbgd.genome.ad.jp/rdf/resource/organism/>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>

SELECT DISTINCT ?gene_id ?cluster_id
WHERE {
    ?group a orth:OrthologGroup ;
           orth:inDataset mbgdr:default ;
           dct:identifier ?cluster_id ;
           orth:member/orth:gene ?gene .
    ?gene orth:organism org:{{arg1}} ;
          dct:identifier ?gene_id .
}
ORDER BY ?gene_id


```
