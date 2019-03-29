# Regex search fo GO

## Parameters
* `arg1`
  * default: photosys

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX up: <http://purl.uniprot.org/core/>

SELECT ?go ?label
WHERE {
    ?go a up:Concept ;
         skos:prefLabel ?label .
    FILTER (regex(?label, "{{arg1}}"))
}


```
