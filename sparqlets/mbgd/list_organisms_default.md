# MBGD default organisms (list)

## Parameters


## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX up: <http://purl.uniprot.org/core/>

SELECT DISTINCT ?organisms_id ?taxid ?superkingdom ?phylum ?name
WHERE {
    mbgdr:default orth:organism ?organisms_id .
    ?organisms_id dct:description ?name ;
                  orth:taxon ?taxid .
    ?taxid rdfs:subClassOf+ ?super .
    ?super up:rank up:Superkingdom ;
           up:scientificName ?superkingdom .
    OPTIONAL {
        ?taxid rdfs:subClassOf+ ?taxon .
        ?taxon up:rank up:Phylum ;
               up:scientificName ?phylum .
    }
}
ORDER BY ?superkingdom ?phylum ?name


```
