# Get differentially expressed human genes for a specific experimental condition, e.g. EFO_0002618 ("pancreatic carcinoma"), converted to UniProt IDs

## Parameters
* `arg1`
  * default: EFO_0002618

## Endpoint
http://www.ebi.ac.uk/rdf/services/sparql

## `result`

```sparql
PREFIX efo: <http://www.ebi.ac.uk/efo/>
PREFIX atlas: <http://rdf.ebi.ac.uk/terms/atlas/>
PREFIX oboTax: <http://purl.obolibrary.org/obo/NCBITaxon_>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>

PREFIX uniprot: <http://purl.uniprot.org/uniprot/>

SELECT DISTINCT ?uniprot
WHERE {
    ?experiment atlas:isAbout oboTax:9606 ;
              atlas:hasAnalysis/atlas:hasExpressionValue ?exp_diff .
    ?exp_diff atlas:hasFactorValue/a efo:{{arg1}} ;
              atlas:isMeasurementOf/atlas:dbXref ?uniprot .
    ?uniprot a atlas:UniprotDatabaseReference .
}


```
