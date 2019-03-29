# List sources of gene-disease association

## Parameters


## Endpoint
http://rdf.disgenet.org/sparql/

## `result`

```sparql
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX ncit: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>

SELECT ?source (COUNT(?source) AS ?count)
WHERE {
    ?gda sio:SIO_000628 ?gene ,
                        ?disease ;
         sio:SIO_000253 ?source .
    ?gene a ncit:C16612 .
    ?disease a ncit:C7057 .
}
ORDER BY DESC(?count)


```
