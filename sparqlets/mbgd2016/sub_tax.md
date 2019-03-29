# SELECT ?sub_tax ?sub_tax_label

## Parameters
* `arg1`
  * default: Crenarchaeota

## Endpoint


## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?tax ?sub_tax ?sub_tax_label
WHERE {
    ?sub_tax rdfs:subClassOf ?tax .
    ?sub_tax rdfs:label ?sub_tax_label .
    ?tax rdfs:label "{{arg1}}" .
}


```
