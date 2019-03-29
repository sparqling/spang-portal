# GO annotation for UniProt IDs

## Parameters
* `arg1`
  * default: goa

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX goa: <http://purl.jp/bio/11/goa#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>

#stdin uniprot:K9Z723
SELECT DISTINCT ?uniprot ?go_id ?go_label ?comment
WHERE {
    VALUES (?uniprot) { (uniprot:K9Z723) }
    ?uniprot ?goa ?go_id .
    ?goa rdfs:subPropertyOf* goa:{{arg1}} ; # goa:goa, goa:goaEXP, etc.
         rdfs:comment ?comment .
    ?go_id skos:prefLabel ?go_label .
}
ORDER BY ?uniprot ?go_label ?comment


```
