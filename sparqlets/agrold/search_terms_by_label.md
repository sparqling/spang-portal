# Search terms by label

## Parameters


## Endpoint
http://volvestre.cirad.fr:8890/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT DISTINCT ?term_id ?term_name ?graph
WHERE { 
    GRAPH ?graph { 
	?term_id rdfs:label ?term_name . 
	FILTER regex(str(?term_name), 'plant growth') 
    } 
}


```
