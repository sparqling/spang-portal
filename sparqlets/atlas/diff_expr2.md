# Get differentially expressed human genes for a specific experimental condition, e.g. EFO_0002618 ("pancreatic carcinoma")

## Parameters
* `arg1`
  * default: EFO_0002618

## Endpoint
http://www.ebi.ac.uk/rdf/services/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX pmid: <http://identifiers.org/pubmed/>
PREFIX atlas: <http://rdf.ebi.ac.uk/terms/atlas/>
PREFIX oboTax: <http://purl.obolibrary.org/obo/NCBITaxon_>
PREFIX efo: <http://www.ebi.ac.uk/efo/>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>

PREFIX uniprot: <http://purl.uniprot.org/uniprot/>
PREFIX pmid: <http://identifiers.org/pubmed/>

SELECT ?uniprot ?probe ?experiment ?pubmed_id ?exp_diff_label
WHERE {
    ?experiment atlas:isAbout oboTax:9606 ;
            atlas:pubmedid ?pubmed_id ;
            atlas:hasAnalysis/atlas:hasExpressionValue ?exp_diff .
    ?exp_diff atlas:hasFactorValue/a efo:{{arg1}} ;
            rdfs:label ?exp_diff_label ;
            atlas:isMeasurementOf ?probe .
    ?probe atlas:dbXref ?uniprot .
    ?uniprot a atlas:UniprotDatabaseReference .
}


```
