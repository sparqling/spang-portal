# Get disease associated with NCBI gene ID

## Parameters
* `arg1`
  * default: 675

## Endpoint
http://rdf.disgenet.org/sparql/

## `result`

```sparql
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX geneid: <http://identifiers.org/ncbigene/>
PREFIX ncit: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX dct: <http://purl.org/dc/terms/>

SELECT ?disease_name ?score ?publication ?date
WHERE {
    ?association sio:SIO_000628 geneid:{{arg1}} , # refers_to
                                ?disease .
    ?disease a ncit:C7057 ; # Disease
             dct:title ?disease_name .
    OPTIONAL {
        ?association sio:SIO_000216 ?measure . # has_measurement_value
	?measure sio:SIO_000300 ?score . # has_value
    }
    OPTIONAL {
        ?association sio:SIO_000772 ?publication . # has_evidence
	?publication dct:issued ?date .
    }
}
ORDER BY DESC(?score) DESC(?date) ?disease_name


```
