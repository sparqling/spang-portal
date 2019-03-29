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
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>

#stdin uniprot:P05067

SELECT DISTINCT ?uniprot ?gene ?gene_label
WHERE {
    ?gene a ncit:C16612 ;
          rdfs:label ?gene_label ;
          sio:SIO_010078/skos:exactMatch ?uniprot .
    OPTIONAL {
    	?gda sio:SIO_000628 ?gene .
    }
    VALUES (?uniprot) { (uniprot:P05067) }
    FILTER (! bound(?gda))
}


```
