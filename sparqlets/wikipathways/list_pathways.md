# List of pathways

## Parameters


## Endpoint
http://sparql.wikipathways.org/

## `result`

```sparql
PREFIX dc: <http://purl.org/dc/elements/1.1/>
PREFIX wp: <http://vocabularies.wikipathways.org/wp#>

SELECT ?pathway ?organism ?name ?title
WHERE {
    ?pathway wp:organism ?organism ;
             wp:organismName ?name ;
             dc:title ?title .
}
ORDER BY ?organism


```
