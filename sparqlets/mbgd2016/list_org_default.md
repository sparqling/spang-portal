# 

## Parameters
* `arg1`
  * default: Crenarchaeota

## Endpoint


## `result`

```sparql
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?org ?label
WHERE {
    mbgdr:default mbgd:organism ?org .
    ?org a mbgd:Genome .
    ?org rdfs:label ?label .
    ?org mbgd:inTaxon ?taxid .
    ?taxid rdfs:label "{{arg1}}" .
}


```
