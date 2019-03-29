# Genomes in a taxonomic range

## Parameters
* `arg1`
  * default: tax:1117* `arg2`
  * default: Complete

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX org: <http://mbgd.genome.ad.jp/rdf/resource/organism/>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX tax: <http://purl.uniprot.org/taxonomy/>

SELECT ?taxid ?mbgd_genome ?genus ?name ?genome_release_date ?reference
{
    {{arg1}} orth:taxon? ?tax_org . # tax:1117, tax:562, org:syn, org:eco, etc.
    ?tax_org up:replacedBy* ?tax . # taxid can be replaced with a new one.
    ?taxid rdfs:subClassOf* ?tax .
    ?taxid up:scientificName ?name .
    ?mbgd_genome orth:taxon ?taxid ;
           dct:issued ?genome_release_date ;
           a mbgd:{{arg2}}Genome . # CompleteGenome or DraftGenome
    OPTIONAL {
        ?mbgd_genome dct:references ?reference .
    }
    OPTIONAL {
        ?taxid rdfs:subClassOf* ?genus_id .
        ?genus_id up:rank up:Genus ;
            up:scientificName ?genus
    }
}
ORDER BY ?genus ?name


```
