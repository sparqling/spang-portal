# MBGD default organisms (count for each phylum)

## Parameters


## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX dct: <http://purl.org/dc/terms/>

# Default organisms summary (phylum)
SELECT ?superkingdom ?phylum (COUNT(?organism) AS ?count)
WHERE {
    mbgdr:default orth:organism ?organism .
    # ?organism dct:identifier ?organism_id ;
    #           dct:description ?organism_name ;
    #           orth:taxon ?taxid .
    ?organism orth:taxon ?taxid .
    ?taxid rdfs:subClassOf* ?taxon .
    ?taxon up:rank up:Superkingdom ;
           up:scientificName ?superkingdom .
    OPTIONAL {
        ?taxid rdfs:subClassOf* ?taxon_opt .
        ?taxon_opt up:rank up:Phylum ;
                   up:scientificName ?phylum .
    }
}
ORDER BY ?superkingdom ?phylum


```
