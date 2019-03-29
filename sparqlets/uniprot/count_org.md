# Count proteins for each organism

## Parameters


## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX up: <http://purl.uniprot.org/core/>

SELECT ?org (COUNT(?org) AS ?count) ?org_name
WHERE {
    ?protein a up:Protein ;
             up:organism ?org .
    ?org up:scientificName ?org_name
}
GROUP BY ?org ?org_name
ORDER BY DESC(?count)


```
