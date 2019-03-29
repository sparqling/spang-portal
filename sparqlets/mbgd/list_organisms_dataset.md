# Selected genomes within taxon range

## Parameters
* `arg1`
  * default: tax1117

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX tax: <http://purl.uniprot.org/taxonomy/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?order_name ?organism ?organism_id
WHERE {
    # ?taxid rdfs:subClassOf* tax:1117 .
    # # ?organism_id a orth:Organism .
    # ?organism_id a mbgd:CompleteGenome .
    mbgdr:{{arg1}} orth:organism ?organism_id .
    ?organism_id dct:description ?organism ;
                 orth:taxon ?taxid .
    OPTIONAL {
        ?taxid rdfs:subClassOf* ?order .
        ?order up:rank up:Order ;
               up:scientificName ?order_name .
    }
}
ORDER BY ?order_name ?organism


```
