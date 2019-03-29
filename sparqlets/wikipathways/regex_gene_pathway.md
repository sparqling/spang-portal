# Get pathway from gene name

## Parameters
* `arg1`
  * default: cyp

## Endpoint
http://sparql.wikipathways.org/

## `result`

```sparql
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX wp: <http://vocabularies.wikipathways.org/wp#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>

# SELECT ?source (COUNT(?gene) AS ?count)
# SELECT ?type (COUNT(?pathway) AS ?count)
SELECT ?gene ?gene_label ?organism_name ?pathway_label ?pathway
WHERE {
    ?gene a wp:GeneProduct .
    # ?gene dc:source ?source .
    ?gene rdfs:label ?gene_label .
    ?gene dct:isPartOf ?pathway .
    ?pathway a wp:Pathway .
    ?pathway dc:title ?pathway_label .
    ?pathway wp:organismName ?organism_name .
    FILTER regex(str(?gene_label), "{{arg1}}", "i")
}
# ORDER BY DESC(?count)
ORDER BY ?organism_name ?gene_label


```
