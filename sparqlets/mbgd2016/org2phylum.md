# 

## Parameters
* `arg1`
  * default: Phylum

## Endpoint


## `result`

```sparql
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX taxont: <http://ddbj.nig.ac.jp/ontologies/taxonomy/>

SELECT DISTINCT ?org ?org_label ?tax ?tax_label
WHERE {
    ?org rdfs:label ?org_label
    OPTIONAL {
	?org mbgd:inTaxon ?tax .
	?tax rdfs:label ?tax_label .
    	?tax taxont:rank taxont:{{arg1}} .
    }
    VALUES (?org) { $STDIN }
}


```
