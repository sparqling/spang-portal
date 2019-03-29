# Search for organism names (regex)

## Parameters
* `arg1`
  * default: Halobacter

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX orth: <http://purl.jp/bio/11/orth#>

SELECT ?org ?org_label ?org_descr ?tax_id ?tax_name
WHERE {
    ?org a orth:Organism ;
         rdfs:label ?org_label ;
         dct:description ?org_descr ;
         orth:taxon ?tax_id .
    ?tax_id up:scientificName ?tax_name .
    FILTER (regex(?tax_name, "{{arg1}}"))
}
ORDER BY ?tax_name


```
