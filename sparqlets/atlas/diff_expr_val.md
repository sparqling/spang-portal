# Get differentially expressed genes for a specific experimental condition, e.g. EFO_0002618 ("pancreatic carcinoma"), with P-values

## Parameters
* `arg1`
  * default: EFO_0002618

## Endpoint
http://www.ebi.ac.uk/rdf/services/sparql

## `result`

```sparql
PREFIX atlas: <http://rdf.ebi.ac.uk/terms/atlas/>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>
PREFIX efo: <http://www.ebi.ac.uk/efo/>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX oboTax: <http://purl.obolibrary.org/obo/NCBITaxon_>

PREFIX uniprot: <http://purl.uniprot.org/uniprot/>

SELECT ?p_value
?t
?probe
# ?uniprot
# ?value
?exp_diff_label ?organism ?condition_type ?condition ?experiment_descr ?experiment ?load_date
WHERE {
    ?experiment # atlas:isAbout oboTax:9606 ;
            atlas:isAbout ?organism ;
            dct:description ?experiment_descr ;
            atlas:atlasLoadDate ?load_date ;
            atlas:hasAnalysis/atlas:hasExpressionValue ?exp_diff .
    ?exp_diff atlas:hasFactorValue ?factor ;
            rdfs:label ?exp_diff_label ;
            sio:SIO_000300 ?value ;
            atlas:tStatistic ?t ;
            atlas:pValue ?p_value ;
            atlas:isMeasurementOf ?probe .
    ?factor a efo:{{arg1}} ;
            atlas:propertyType ?condition_type ;
            atlas:propertyValue ?condition .
    # ?probe atlas:dbXref ?uniprot .
    # ?uniprot a atlas:UniprotDatabaseReference .
}


```
