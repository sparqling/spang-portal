# Genomes above TaxID

## Parameters
* `arg1`
  * default: tax:511145* `arg2`
  * default: Complete

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>

SELECT ?genome ?description ?taxid ?rank ?name ?date ?reference
{
    {{arg1}} orth:taxon? ?tax_org .
    ?tax_org up:replacedBy* ?tax . # taxid can be replaced with a new ID
    ?tax rdfs:subClassOf ?taxid option(transitive, t_direction 1, t_min 0, t_step("step_no") as ?level) . # only for Virtuoso
    ?taxid up:scientificName ?name .
    OPTIONAL {
        ?taxid up:rank ?rank .
    }
    ?genome dct:description ?description .
    ?genome orth:taxon ?taxid .
    ?genome a mbgd:{{arg2}}Genome . # CompleteGenome or DraftGenome
    ?genome dct:issued ?date .
    OPTIONAL {
        ?genome dct:references ?reference .
    }
}
ORDER BY DESC(?level)


```
