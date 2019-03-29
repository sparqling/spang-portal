# Get ortholog in specific taxon from Ensembl gene ID

## Parameters
* `arg1`
  * default: ENSG00000139618* `arg2`
  * default: 10090

## Endpoint
http://www.ebi.ac.uk/rdf/services/sparql

## `result`

```sparql
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX taxid: <http://identifiers.org/taxonomy/>
PREFIX ens: <http://rdf.ebi.ac.uk/resource/ensembl/>
PREFIX obo: <http://purl.obolibrary.org/obo/>

SELECT ?ortholog
WHERE {
    ens:{{arg1}} sio:SIO_000558 ?ortholog .
    ?ortholog obo:RO_0002162 taxid:{{arg2}} .
}


```
