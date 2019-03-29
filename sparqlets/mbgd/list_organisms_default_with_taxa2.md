# Default organisms list

## Parameters


## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>

SELECT DISTINCT ?organisms_id ?superkingdom ?phylum ?name ?taxid ?date ?reference
WHERE {
    mbgdr:default orth:organism ?organisms_id .
    ?organisms_id dct:description ?name ;
                  orth:taxon ?taxid ;
                  dct:issued ?date .
    OPTIONAL {
	?organisms_id dct:references ?reference
    }
    ?taxid rdfs:subClassOf+ ?taxon1 .
    ?taxon1 up:rank up:Superkingdom ;
            up:scientificName ?superkingdom .
    OPTIONAL {
        ?taxid rdfs:subClassOf+ ?taxon2 .
        ?taxon2 up:rank up:Phylum ;
                   up:scientificName ?phylum .
    }
}
ORDER BY ?superkingdom ?phylum ?organism_name


```
