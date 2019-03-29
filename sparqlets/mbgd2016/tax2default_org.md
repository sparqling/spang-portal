# 

## Parameters


## Endpoint


## `result`

```sparql
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>

SELECT DISTINCT ?taxon ?org
WHERE {
    VALUES (?taxon) { $STDIN }
    mbgdr:default mbgd:organism ?org .
    ?org a mbgd:Genome .
    ?org mbgd:inTaxon ?taxon .
}


```
