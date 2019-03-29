# 

## Parameters


## Endpoint
http://dbpedia.org/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?resource ?label
WHERE {
    VALUES (?resource) { $STDIN }
    OPTIONAL {
	?resource rdfs:label ?label .
    }
}


```
