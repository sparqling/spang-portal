# Members of cluster

## Parameters
* `arg1`
  * default: 2000

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX dct: <http://purl.org/dc/terms/>

SELECT ?superkingdom ?phylum ?organism_name ?domain ?gene_description
WHERE {
    ?cluster a orth:OrthologGroup ;
            orth:inDataset mbgdr:default ;
            dct:identifier "{{arg1}}";
            orth:member ?member .
    ?member orth:gene ?gene ;
            orth:organism ?organism ;
            rdfs:label ?domain .
    ?organism dct:description ?organism_name ;
            orth:taxon ?tax_id .   
    ?gene dct:description ?gene_description .
    ?tax_id rdfs:subClassOf+ ?taxon .
    ?taxon up:rank up:Superkingdom ;
           up:scientificName ?superkingdom .
    OPTIONAL {
        ?tax_id rdfs:subClassOf+ ?phylum_id .
        ?phylum_id up:rank up:Phylum ;
                   up:scientificName ?phylum .
    }
}
ORDER BY ?superkingdom ?phylum ?organism_name ?domain


```
