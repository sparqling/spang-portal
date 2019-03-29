# 

## Parameters
* `arg1`
  * default: Salmonella

## Endpoint
http://dbpedia.org/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dbpedia: <http://dbpedia.org/resource/>
PREFIX dbo: <http://dbpedia.org/ontology/>

SELECT ?label ?abst
WHERE {
    dbpedia:{{arg1}} rdfs:label ?label .
    dbpedia:{{arg1}} dbo:abstract ?abst .

    BIND(lang(?label) AS ?lang)
    BIND(lang(?abst) AS ?abst_lang)

    VALUES (?lang) { ("en") ("ja") }
    VALUES (?abst_lang) { ("en") ("ja") }
}


```
