# SELECT ?uniprot ?uniprot_label

## Parameters
* `arg1`
  * default: GO_0045202

## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?uniprot
FROM <http://sparql.uniprot.org/uniprot/>
WHERE {
    ?uniprot up:classifiedWith obo:{{arg1}} .
    # ?uniprot up:classifiedWith obo:{{arg1}} ;
    #          rdfs:label ?uniprot_label .
    VALUES (?uniprot) { $STDIN }
}


```
