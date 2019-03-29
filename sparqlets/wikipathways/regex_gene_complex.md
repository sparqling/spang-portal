# Get complex from gene name

## Parameters
* `arg1`
  * default: cyp

## Endpoint
http://sparql.wikipathways.org/

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX dc: <http://purl.org/dc/elements/1.1/>
PREFIX wp: <http://vocabularies.wikipathways.org/wp#>

# SELECT ?source (COUNT(?gene) AS ?count)
# SELECT ?type (COUNT(?complex) AS ?count)
SELECT ?gene ?gene_label ?organism_name ?complex
WHERE {
    ?gene a wp:GeneProduct .
    # ?gene dc:source ?source .
    ?gene rdfs:label ?gene_label .
    ?gene dct:isPartOf ?complex .
    # ?complex a ?type .
    # ?complex a wp:Pathway .
    # ?complex a wp:Interaction .
    ?complex a wp:Complex .
    ?complex dct:isPartOf/wp:organismName ?organism_name .
    FILTER regex(str(?gene_label), "{{arg1}}", "i")
    # FILTER (?type != wp:Pathway)
    # MINUS {
    # 	?complex a wp:Pathway .
    # }
    # MINUS {
    # 	?complex a wp:Interaction .
    # }
}
# ORDER BY DESC(?count)


```
