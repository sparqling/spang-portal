# 

## Parameters
* `arg1`
  * default: Crenarchaeota

## Endpoint


## `result`

```sparql
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?org ?label
WHERE {
    ?org a mbgd:Genome .
    ?org rdfs:label ?label .
    ?org mbgd:inTaxon ?taxid .
    ?taxid rdfs:label "{{arg1}}" .
}


```
