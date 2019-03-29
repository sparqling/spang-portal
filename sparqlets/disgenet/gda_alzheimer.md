# Alzheimer's disease-related genes with curated evidences

## Parameters


## Endpoint
http://rdf.disgenet.org/sparql/

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX pmid: <http://identifiers.org/pubmed/>
PREFIX ncit: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX sio: <http://semanticscience.org/resource/>

PREFIX upid: <http://identifiers.org/uniprot/>
PREFIX pmid: <http://identifiers.org/pubmed/>
PREFIX disgenet_source: <http://rdf.disgenet.org/v4.0.0/void/>

SELECT ?score ?gene_label ?protein ?source ?pmid ?description
WHERE {
    ?gda sio:SIO_000628 ?gene ,
                        ?disease ;
         a ?type ;
         # up:organism ?tax ;
         sio:SIO_000253 ?source ;
         sio:SIO_000216/sio:SIO_000300 ?score .
    FILTER regex(?source, "/(uniprot|ctd_human|clinvar|orphanet|gwascat)-")
    ?gene a ncit:C16612 ;
          rdfs:label ?gene_label .
    ?disease a ncit:C7057 ;
          dct:title "Alzheimer's Disease"@en .
    OPTIONAL {
	?gda sio:SIO_000772 ?pmid ;
	     dct:description ?description .
    }
    OPTIONAL {
	?gene sio:SIO_010078 ?protein .
    }
}
ORDER BY DESC(?score) ?source ?pmid


```
