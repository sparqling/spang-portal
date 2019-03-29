# Regex seach for specific diseases that have gene-disease association information

## Parameters
* `arg1`
  * default: alzheimer

## Endpoint
http://rdf.disgenet.org/sparql/

## `result`

```sparql
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX ncit: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>
PREFIX umls: <http://linkedlifedata.com/resource/umls/id/>
PREFIX sio: <http://semanticscience.org/resource/>

PREFIX umls: <http://linkedlifedata.com/resource/umls/id/>

SELECT ?disease ?disease_name (COUNT(?disease) AS ?count)
WHERE {
    ?gda sio:SIO_000628 ?gene , ?disease ;
         sio:SIO_000253 ?source .
    ?gene a ncit:C16612 .
    ?disease a ncit:C7057 ;
          dct:title ?disease_name
    FILTER regex(?disease_name, "{{arg1}}", "i")
}
ORDER BY DESC(?count)


```
