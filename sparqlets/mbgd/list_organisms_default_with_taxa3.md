# Default organisms list

## Parameters


## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dct: <http://purl.org/dc/terms/>

SELECT DISTINCT ?organisms_id ?superkingdom ?phylum ?family ?name ?taxid
WHERE {
    mbgdr:default orth:organism ?organisms_id .
    ?organisms_id dct:description ?name ;
                  orth:taxon ?taxid .
    ?taxid rdfs:subClassOf+ ?taxon1 .
    ?taxon1 up:rank up:Superkingdom ;
            up:scientificName ?superkingdom .
    OPTIONAL {
        ?taxid rdfs:subClassOf+ ?taxon2 .
        ?taxon2 up:rank up:Phylum ;
                   up:scientificName ?phylum .
    }
    OPTIONAL {
        ?taxid rdfs:subClassOf+ ?taxon3 .
        ?taxon3 up:rank up:Family ;
                    up:scientificName ?family .
    }
}
ORDER BY ?superkingdom ?phylum ?family ?organism_name


```
