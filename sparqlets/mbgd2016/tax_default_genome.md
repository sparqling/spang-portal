# 

## Parameters
* `arg1`
  * default: 2* `arg2`
  * default: 29* `arg3`
  * default: 1117

## Endpoint


## `result`

```sparql
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX taxid: <http://identifiers.org/taxonomy/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>

SELECT ?code ?organism ?length ?date
WHERE {
    mbgdr:default
         mbgd:organism ?genome .
    ?genome
        mbgd:inTaxon taxid:{{arg1}} ;
        rdfs:label ?organism ;
        dct:identifier ?code ;
        mbgd:assemblyTotalLength ?length ;
        dct:issued ?date .
}
ORDER BY ?date


```
