# Get orthologs in UniProt IDs

## Parameters
* `arg1`
  * default: K9Z723

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>

SELECT ?uniprot
WHERE {
    ?group a orth:OrthologGroup ;
           orth:member/orth:gene/mbgd:uniprot uniprot:{{arg1}} ;
           orth:member/orth:gene/mbgd:uniprot ?uniprot ;
           orth:inDataset mbgdr:default .
}


```
