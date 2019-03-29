# List of TaxIDs

## Parameters
* `arg1`
  * default: 10

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX orth: <http://purl.jp/bio/11/orth#>

SELECT ?taxid
WHERE {
    ?organism orth:taxon ?taxid .
}
LIMIT {{arg1}}


```
