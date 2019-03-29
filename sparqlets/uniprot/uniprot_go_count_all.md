# 

## Parameters


## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX tax: <http://purl.uniprot.org/taxonomy/>

SELECT (COUNT(?uniprot) AS ?count) ?go ?go_label
WHERE {
    ?uniprot up:classifiedWith ?go ;
        up:organism tax:9606 .
    ?go up:database <http://purl.uniprot.org/database/go> ;
        rdfs:label ?go_label .
}


```
