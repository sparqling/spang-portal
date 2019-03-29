# Get diseases associated with given UniProt IDs

## Parameters


## Endpoint
http://rdf.disgenet.org/sparql/

## `result`

```sparql
PREFIX ncit: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>

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
    # VALUES (?source) { (<http://rdf.disgenet.org/v4.0.0/void/uniprot-2016>)
    #                  (<http://rdf.disgenet.org/v4.0.0/void/ctd_human-2016>)
    #                  (<http://rdf.disgenet.org/v4.0.0/void/clinvar-2016>)
    #                  (<http://rdf.disgenet.org/v4.0.0/void/orphanet-2016>)
    #                  (<http://rdf.disgenet.org/v4.0.0/void/gwascat-2016>) }
    # FILTER regex(?source, "/(uniprot|ctd_human|clinvar|orphanet|gwascat)-")
}
ORDER BY DESC(?score) ?source ?pmid


```
