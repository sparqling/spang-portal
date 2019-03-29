# Get pathway from gene name

## Parameters


## Endpoint
http://sparql.wikipathways.org/

## `result`

```sparql
PREFIX geneid: <http://identifiers.org/ncbigene/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX wp: <http://vocabularies.wikipathways.org/wp#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>
PREFIX dct: <http://purl.org/dc/terms/>

#stdin geneid:1577
# SELECT ?source (COUNT(?gene) AS ?count)
# SELECT ?type (COUNT(?pathway) AS ?count)
SELECT ?gene_label ?organism_name ?pathway_label ?pathway
WHERE {
    ?gene rdfs:label ?gene_label ;
             dct:isPartOf ?pathway .
    ?pathway a wp:Pathway ;
             dc:title ?pathway_label ;
             wp:organismName ?organism_name .
    VALUES (?gene) { (geneid:1577) }
}
# ORDER BY DESC(?count)


```
