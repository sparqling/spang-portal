# 

## Parameters
* `arg1`
  * default: Actinobacteria

## Endpoint


## `result`

```sparql
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX taxont: <http://ddbj.nig.ac.jp/ontologies/taxonomy/>

SELECT ?taxid ?rank (COUNT(?organism) AS ?count)
WHERE {
    ?taxid taxont:scientificName "{{arg1}}" ;
           taxont:rank ?rank .
    ?organism mbgd:inTaxon ?taxid ;
           a mbgd:CompleteGenome .
}
ORDER BY DESC(?count)


```
