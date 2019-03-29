# List of organisms associated with UniProt IDs

## Parameters


## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX up: <http://purl.uniprot.org/core/>

SELECT DISTINCT ?organism ?organism_name
WHERE {
    ?protein up:organism ?organism .
    ?organism up:scientificName ?organism_name .
}


```
