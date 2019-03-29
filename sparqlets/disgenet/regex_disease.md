# Search the NCI Thesaurus for specific diseases

## Parameters
* `arg1`
  * default: breast

## Endpoint
http://rdf.disgenet.org/sparql/

## `result`

```sparql
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX ncit: <http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#>

SELECT *
WHERE {
    ?disease a ncit:C7057 ;
        dct:title ?disease_name .
    FILTER (regex(?disease_name, "{{arg1}}", "i"))
}


```
