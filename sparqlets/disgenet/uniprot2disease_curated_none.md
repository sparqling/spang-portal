# Get diseases associated with given UniProt IDs

## Parameters


## Endpoint
http://rdf.disgenet.org/sparql/

## `result`

```sparql
PREFIX wi: <http://purl.org/ontology/wi/core#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX ncit: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>

#stdin uniprot:P05067
PREFIX disgenet_source: <http://rdf.disgenet.org/v4.0.0/void/>

SELECT DISTINCT ?uniprot ?gene ?gene_label
#?source ?gda
WHERE {
    ?gene a ncit:C16612 ;
          rdfs:label ?gene_label ;
          sio:SIO_010078/skos:exactMatch ?uniprot .
    OPTIONAL {
    	?gda sio:SIO_000628 ?gene ;
             sio:SIO_000253/wi:evidence disgenet_source:source_evidence_curated .
    }
    VALUES (?uniprot) { (uniprot:P05067) }
    FILTER (! bound(?gda))
}


```
