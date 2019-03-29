# 

## Parameters
* `arg1`
  * default: Q9Y2J0

## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>

SELECT DISTINCT ?go ?go_label
WHERE {
    uniprot:{{arg1}} up:classifiedWith ?go .
    ?go up:database <http://purl.uniprot.org/database/go> ;
        rdfs:label ?go_label .
}
ORDER BY ?go_label


```
