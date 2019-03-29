# Get UniProt IDs for a specific disease, e.g. C0751955 ("Brain Infarction")

## Parameters
* `arg1`
  * default: C0751955

## Endpoint
http://rdf.disgenet.org/sparql/

## `result`

```sparql
PREFIX ncit: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX umls: <http://linkedlifedata.com/resource/umls/id/>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

PREFIX uniprot: <http://purl.uniprot.org/uniprot/>
PREFIX disgenet_source: <http://rdf.disgenet.org/v4.0.0/void/>

SELECT DISTINCT ?uniprot ?score ?gene_label ?source
# COUNT(DISTINCT ?gda)
# ?gda
# ?pmid ?description
WHERE {
    ?gda sio:SIO_000628 umls:{{arg1}} ,
                        ?gene ;
          a ?type ;
          sio:SIO_000253 ?source ;
          sio:SIO_000216/sio:SIO_000300 ?score .
    ?gene a ncit:C16612 ;
          rdfs:label ?gene_label ;
          sio:SIO_010078/skos:exactMatch ?uniprot .
    OPTIONAL {
        ?gda sio:SIO_000772 ?pmid ;
             dct:description ?description .
    }
    FILTER regex(?uniprot, "purl.uniprot.org")
    # VALUES (?source) { (<http://rdf.disgenet.org/v4.0.0/void/uniprot-2016>)
    #                    (<http://rdf.disgenet.org/v4.0.0/void/ctd_human-2016>)
    #                    (<http://rdf.disgenet.org/v4.0.0/void/clinvar-2016>)
    #                    (<http://rdf.disgenet.org/v4.0.0/void/orphanet-2016>)
    #                    (<http://rdf.disgenet.org/v4.0.0/void/gwascat-2016>) }
    # FILTER regex(?source, "/(uniprot|ctd_human|clinvar|orphanet|gwascat)-")
}
ORDER BY DESC(?score) ?uniprot ?source ?pmid


```
