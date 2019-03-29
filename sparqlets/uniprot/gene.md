# From UniProt ID to gene name

## Parameters
* `arg1`
  * default: K9Z723

## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

SELECT ?property ?value
WHERE {
    uniprot:{{arg1}} up:encodedBy ?gene .
    ?gene ?property ?value .
    FILTER (?property != rdf:type)
}


```
