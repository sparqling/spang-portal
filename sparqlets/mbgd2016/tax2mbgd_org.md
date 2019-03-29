# 

## Parameters


## Endpoint


## `result`

```sparql
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>

SELECT DISTINCT ?taxon ?org
WHERE {
    VALUES (?taxon) { $STDIN }
    ?org a mbgd:Genome .
    ?org mbgd:inTaxon ?taxon .
}


```
