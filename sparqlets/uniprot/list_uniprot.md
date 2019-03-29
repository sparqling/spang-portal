# List of UniProt IDs

## Parameters


## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX up: <http://purl.uniprot.org/core/>

SELECT ?uniprot ?mnemonic ?label
WHERE {
    ?uniprot a up:Protein .
    OPTIONAL {
	?uniprot up:mnemonic ?mnemonic .
    }
    OPTIONAL {
	?uniprot rdfs:label ?label .
    }
}


```
