# Filter UniProt IDs by GO annotation

## Parameters
* `arg1`
  * default: GO_0045202

## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>
PREFIX obo: <http://purl.obolibrary.org/obo/>

#stdin uniprot:K9Z723
#stdin uniprot:A0A024R9E7
SELECT ?uniprot
WHERE {
    VALUES (?uniprot) { (uniprot:K9Z723)
                        (uniprot:A0A024R9E7) }
    ?uniprot up:classifiedWith obo:{{arg1}} .
}


```
