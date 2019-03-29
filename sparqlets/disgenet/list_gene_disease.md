# List gene disease associations

## Parameters
* `arg1`
  * default: 10

## Endpoint
http://rdf.disgenet.org/sparql/

## `result`

```sparql
PREFIX ncit: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?disease_label ?gene_label ?protein
WHERE {
    ?gda sio:SIO_000628 ?gene ,
                        ?disease .
    ?gene a ncit:C16612 ;
          rdfs:label ?gene_label ;
          sio:SIO_010078 ?protein .
    ?disease a ncit:C7057 ;
          rdfs:label ?disease_label .
}
LIMIT {{arg1}}


```
