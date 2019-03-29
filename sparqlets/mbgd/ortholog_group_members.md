# Members of cluster

## Parameters
* `arg1`
  * default: 2000* `arg2`
  * default: default

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX dct: <http://purl.org/dc/terms/>

SELECT ?superkingdom ?phylum ?order ?organism_name ?domain ?gene_description ?protein
WHERE {
    ?cluster a orth:OrthologGroup ;
            orth:inDataset mbgdr:{{arg2}} ;
            dct:identifier "{{arg1}}";
            orth:member ?member .
    ?member orth:gene ?gene ;
            rdfs:label ?domain ;
            orth:organism ?organism .
    ?gene dct:description ?gene_description ;
	    orth:protein ?protein .
    ?organism dct:description ?organism_name ;
            mbgd:inTaxon ?superkingdom_id .
    ?superkingdom_id up:rank up:Superkingdom ;
                     up:scientificName ?superkingdom .
    OPTIONAL {
        ?organism mbgd:inTaxon ?phylum_id .
        ?phylum_id up:rank up:Phylum ;
                   up:scientificName ?phylum .
    }
    OPTIONAL {
        ?organism mbgd:inTaxon ?order_id .
        ?order_id up:rank up:Order ;
                   up:scientificName ?order .
    }
}
ORDER BY ?superkingdom ?phylum ?order ?organism_name ?domain


```
