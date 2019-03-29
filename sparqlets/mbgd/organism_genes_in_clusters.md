# Cluster IDs for each gene of

## Parameters
* `arg1`
  * default: syn

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX org: <http://mbgd.genome.ad.jp/rdf/resource/organism/>

SELECT DISTINCT ?gene ?gene_id ?gene_name ?domain_no ?cluster ?cluster_id ?cluster_descr
WHERE {
    ?cluster a orth:OrthologGroup ;
          orth:inDataset mbgdr:default ;
          dct:identifier ?cluster_id ;
          dct:description ?cluster_descr ;
          orth:member ?domain .
    ?domain dct:identifier ?domain_no ;
          orth:gene ?gene .
    ?gene orth:organism org:{{arg1}} ;
          rdfs:label ?gene_name ;
          dct:identifier ?gene_id .
}
ORDER BY ?gene_id


```
