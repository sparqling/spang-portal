# List of organisms

## Parameters


## Endpoint
http://sparql.wikipathways.org/

## `result`

```sparql
PREFIX wp: <http://vocabularies.wikipathways.org/wp#>

SELECT ?organism ?name (COUNT(?s) AS ?count)
WHERE {
    ?s wp:organism ?organism;
       wp:organismName ?name .
}
ORDER BY DESC(?count)


```
