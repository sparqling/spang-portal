# 

## Parameters
* `arg1`
  * default: 2

## Endpoint


## `result`

```sparql
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX taxid: <http://identifiers.org/taxonomy/>
PREFIX taxont: <http://ddbj.nig.ac.jp/ontologies/taxonomy/>

SELECT ?rank ?name (COUNT(?organism) AS ?count)
WHERE {
    ?taxid mbgd:parentTaxonShown taxid:{{arg1}} ;
           taxont:scientificName ?name ;
	   taxont:rank ?rank .
    ?organism mbgd:inTaxon ?taxid ;
	   a mbgd:CompleteGenome .   
}
ORDER BY ?name


```
