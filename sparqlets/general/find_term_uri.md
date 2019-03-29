# Find classes or properties (regex search for URIs or labels)

## Parameters
* `arg1`
  * default: homolo

## Endpoint
http://dbpedia.org/sparql

## `result`

```sparql
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT DISTINCT ?term_type ?term_uri ?term_label
WHERE {
    VALUES (?term_type) { (owl:Class)
    	                  (rdfs:Class)
    	                  (rdf:Property)
	                  (owl:ObjectProperty)
                          (owl:DatatypeProperty)
                          (owl:AnnotationProperty) }
    ?term_uri a ?term_type .
    OPTIONAL {
        ?term_uri rdfs:label ?term_label .
    }
    {
	FILTER (regex(str(?term_label), "{{arg1}}", "i"))
    }
    UNION
    {
	FILTER (regex(str(?class), "{{arg1}}", "i"))
    }
}
ORDER BY ?term_type ?term_uri


```
