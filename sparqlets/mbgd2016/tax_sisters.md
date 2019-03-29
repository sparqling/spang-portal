# SELECT ?rank ?name ?taxid

## Parameters
* `arg1`
  * default: 2* `arg2`
  * default: 543

## Endpoint


## `result`

```sparql
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX taxid: <http://identifiers.org/taxonomy/>
PREFIX taxont: <http://ddbj.nig.ac.jp/ontologies/taxonomy/>

SELECT ?rank ?name (COUNT(?organism) AS ?count)
WHERE {
    taxid:{{arg1}} mbgd:parentTaxonComplete ?parent .
    ?taxid mbgd:parentTaxonComplete ?parent .
    ?taxid taxont:scientificName ?name ;
    	   taxont:rank ?rank .
    ?organism mbgd:inTaxon ?taxid ;
    	   a mbgd:CompleteGenome .   
}
ORDER BY ?name


```
