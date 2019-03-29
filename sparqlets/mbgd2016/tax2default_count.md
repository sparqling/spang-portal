# 

## Parameters


## Endpoint


## `result`

```sparql
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>

SELECT ?tax (COUNT(?org) AS ?count)
WHERE {
    VALUES (?tax) { $STDIN }
    ?org mbgd:inTaxon ?tax .
    mbgdr:default mbgd:organism ?org .
}


```
