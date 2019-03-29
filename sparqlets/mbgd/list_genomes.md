# List genomes in MBGD

## Parameters
* `arg1`
  * default: Complete

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX dct: <http://purl.org/dc/terms/>

SELECT ?taxid ?mbgd_genome ?name ?genome_release_date ?reference
{
    ?mbgd_genome orth:taxon ?taxid ;
        dct:description ?name ;
        dct:issued ?genome_release_date .
    ?mbgd_genome a mbgd:{{arg1}}Genome . # CompleteGenome or DraftGenome
    OPTIONAL {
        ?mbgd_genome dct:references ?reference .
    }
}
ORDER BY ?name


```
