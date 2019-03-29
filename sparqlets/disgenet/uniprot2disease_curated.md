# Get diseases associated with given UniProt IDs

## Parameters


## Endpoint
http://rdf.disgenet.org/sparql/

## `result`

```sparql
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX ncit: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>

#stdin uniprot:P05067
PREFIX disgenet_source: <http://rdf.disgenet.org/v4.0.0/void/>

SELECT DISTINCT ?uniprot ?disease_label ?score ?gene_label ?source
# ?pmid ?sentence
WHERE {
    ?gda sio:SIO_000628 ?gene ,
                        ?disease ;
          a ?type ;
          sio:SIO_000253 ?source ;
          sio:SIO_000216/sio:SIO_000300 ?score .
    ?gene a ncit:C16612 ;
          rdfs:label ?gene_label ;
          sio:SIO_010078/skos:exactMatch ?uniprot .
    ?disease a ncit:C7057 ;
          rdfs:label ?disease_label .
    OPTIONAL {
        ?gda sio:SIO_000772 ?pmid ;
             dct:description ?sentence .
    }
    VALUES (?uniprot) { (uniprot:P05067) }
    VALUES (?source) { (disgenet_source:uniprot-2016)
                       (disgenet_source:ctd_human-2016)
                       (disgenet_source:clinvar-2016)
                       (disgenet_source:orphanet-2016)
                       (disgenet_source:gwascat-2016) }
}
ORDER BY DESC(?score) ?source ?pmid


```
