# Get ortholog GO annotation from gene ID

## Parameters
* `arg1`
  * default: eco:B0002

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX goa: <http://purl.jp/bio/11/goa#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?cluster ?gene_id ?organism ?go ?comment
WHERE {
    ?cluster a orth:OrthologGroup ;
             orth:inDataset mbgdr:default ;
             orth:member/orth:gene/dct:identifier "{{arg1}}" ;
             orth:member/orth:gene ?gene .
    ?gene mbgd:uniprot ?uniprot ;
          dct:identifier ?gene_id ;
	  orth:organism/dct:description ?organism .
    ?uniprot ?goa ?go_id .
    ?goa rdfs:comment ?comment ;
         rdfs:subPropertyOf+ goa:goaExperimental .
    ?go_id skos:prefLabel ?go .
}


```
