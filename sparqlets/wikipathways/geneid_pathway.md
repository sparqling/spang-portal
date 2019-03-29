# Get pathway from gene name

## Parameters
* `arg1`
  * default: 1577

## Endpoint
http://sparql.wikipathways.org/

## `result`

```sparql
PREFIX geneid: <http://identifiers.org/ncbigene/>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dc: <http://purl.org/dc/elements/1.1/>
PREFIX wp: <http://vocabularies.wikipathways.org/wp#>

# SELECT ?source (COUNT(?gene) AS ?count)
# SELECT ?type (COUNT(?pathway) AS ?count)
SELECT ?gene_label ?organism_name ?pathway_label ?pathway
WHERE {
    geneid:{{arg1}} rdfs:label ?gene_label ;
                dct:isPartOf ?pathway .
    ?pathway a wp:Pathway ;
             dc:title ?pathway_label ;
             wp:organismName ?organism_name .
}
# ORDER BY DESC(?count)


```
