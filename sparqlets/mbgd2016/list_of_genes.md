# 

## Parameters


## Endpoint


## `result`

```sparql
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX orthology: <http://purl.org/net/orth#>
PREFIX obo: <http://purl.obolibrary.org/obo/>

SELECT ?gene ?gene_id ?tax_id
WHERE {
    ?gene a orthology:Gene ;
          dct:identifier ?gene_id ;
          obo:RO_0002162 ?tax_id .
}


```
