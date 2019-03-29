# Cluster in Newick tree format

## Parameters
* `arg1`
  * default: 2000

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>

SELECT ?cluster ?tree
WHERE {
    ?cluster a orth:OrthologGroup ;
             orth:inDataset mbgdr:default ;
             dct:identifier "{{arg1}}";
	     mbgd:newickTree ?tree .
}


```
