# Get differentially expressed human genes for a specific experimental condition, e.g. EFO_0000249 ("Alzheimer's disease")

## Parameters
* `arg1`
  * default: EFO_0000249

## Endpoint
http://www.ebi.ac.uk/rdf/services/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX efo: <http://www.ebi.ac.uk/efo/>
PREFIX atlas: <http://rdf.ebi.ac.uk/terms/atlas/>

SELECT ?uniprot ?probe ?experiment ?pubmed ?expr_label
WHERE {
    ?experiment atlas:pubmedid ?pubmed ;
            atlas:hasAnalysis/atlas:hasExpressionValue ?diff_expr .
    ?diff_expr rdfs:label ?expr_label ;
            atlas:hasFactorValue/a efo:{{arg1}} ;
            atlas:isMeasurementOf ?probe .
    ?probe atlas:dbXref ?uniprot .
    ?uniprot a atlas:UniprotDatabaseReference .
}


```
