# 

## Parameters
* `arg1`
  * default: tax:511145

## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX up: <http://purl.uniprot.org/core/>

SELECT *
WHERE {
    ?protein a up:Protein ;
             up:organism {{arg1}} .
}


```
