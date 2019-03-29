# Get differential gene expression of given UniProt IDs

## Parameters


## Endpoint
http://www.ebi.ac.uk/rdf/services/sparql

## `result`

```sparql
PREFIX ebiatlas: <http://rdf.ebi.ac.uk/resource/atlas/>
PREFIX atlas: <http://rdf.ebi.ac.uk/terms/atlas/>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>

#STDIN uniprot:Q15848
PREFIX ebiatlas: <http://rdf.ebi.ac.uk/resource/atlas/>

SELECT ?p_value ?probe ?value ?condition_type ?condition ?experiment_descr ?experiment ?load_date
WHERE {
    ?experiment atlas:hasAnalysis/atlas:hasExpressionValue ?exp_diff ;
            dct:description ?experiment_descr ;
            atlas:atlasLoadDate ?load_date .
    ?exp_diff atlas:hasFactorValue ?factor ;
            sio:SIO_000300 ?value ;
            atlas:pValue ?p_value ;
            atlas:isMeasurementOf ?probe .
    ?factor atlas:propertyType ?condition_type ;
            atlas:propertyValue ?condition .
    ?probe atlas:dbXref ?uniprot .
    VALUES (?uniprot) { (uniprot:Q15848) }
}


```
