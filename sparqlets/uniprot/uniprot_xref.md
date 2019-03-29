# Get cross-reference from UniProtID to other database

## Parameters
* `arg1`
  * default: PDB

## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>

#stdin uniprot:P74367
SELECT ?uniprot ?xref
WHERE {
    VALUES (?uniprot) { (uniprot:P74367) }
    ?uniprot rdfs:seeAlso ?xref .
    ?xref up:database <http://purl.uniprot.org/database/{{arg1}}> .
}


```
