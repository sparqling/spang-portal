# GO annotation for cluster

## Parameters
* `arg1`
  * default: 2000

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
define input:inference "mbgd"

PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX goa: <http://purl.jp/bio/11/goa#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>

SELECT ?go_id (COUNT (?go_id) AS ?go_count) (xsd:decimal(?go_count) / ?member_count AS ?go_ratio) ?go_label
WHERE {
    ?cluster a orth:OrthologGroup ;
             orth:inDataset mbgdr:default ;
             dct:identifier "{{arg1}}";
             mbgd:memberCount ?member_count ;
             orth:member ?member .
    ?member orth:gene/mbgd:uniprot/goa:goa ?go_id .
    ?go_id skos:prefLabel ?go_label .
}
ORDER BY DESC(?go_count)


```
