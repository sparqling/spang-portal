# 

## Parameters


## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?go ?go_label (count(?uniprot) as ?count)
WHERE {
    ?go rdfs:label ?go_label .
    {
	SELECT DISTINCT ?uniprot ?go
	WHERE {
	    VALUES (?uniprot) { $STDIN }
	    ?uniprot up:classifiedWith ?go .
	    ?go up:database <http://purl.uniprot.org/database/go> .
	}
    }
}
ORDER BY DESC(?count)


```
