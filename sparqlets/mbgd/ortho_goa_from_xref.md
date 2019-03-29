# GO annotation for orthologs of

## Parameters
* `arg1`
  * default: uniprot:K9Z723

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
define input:inference "mbgd"

PREFIX ncbiprotein: <http://www.ncbi.nlm.nih.gov/protein/>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX goa: <http://purl.jp/bio/11/goa#>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>

SELECT DISTINCT ?organism ?gene ?go_term ?evidence
WHERE {
    ?group a orth:OrthologGroup ;
         orth:inDataset mbgdr:default ;
         orth:member/orth:crossReference* {{arg1}} ; # or ncbiprotein:YP_007162988.1
         orth:member/orth:gene ?gene_id .
    ?gene_id mbgd:uniprot ?uniprot ;
         dct:identifier ?gene ;
         orth:organism/dct:description ?organism .
    ?uniprot ?goa ?go_id .
    ?goa rdfs:subPropertyOf+ goa:goaExperimental ;
         rdfs:comment ?evidence .
    ?go_id skos:prefLabel ?go_term .
}
ORDER BY ?gene


```
