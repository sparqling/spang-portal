# Search clusters (description regex)

## Parameters
* `arg1`
  * default: RNA* `arg2`
  * default: polymerase

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?group (COUNT(?member) AS ?size) ?label ?description
WHERE {
    ?group a orth:OrthologGroup ;
           rdfs:label ?label ;
           dct:description ?description ;
           orth:member ?member .
    FILTER (regex(?description, "{{arg1}}"))
}
ORDER BY ?description ?label DESC(?size)


```
