# Get ortholog from Ensembl gene ID

## Parameters
* `arg1`
  * default: ENSG00000139618

## Endpoint
http://www.ebi.ac.uk/rdf/services/sparql

## `result`

```sparql
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX ens: <http://rdf.ebi.ac.uk/resource/ensembl/>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?label ?altLabel ?taxon ?ortholog
WHERE {
    ens:{{arg1}} sio:SIO_000558 ?ortholog .
    ?ortholog obo:RO_0002162 ?taxon .
    ?taxon rdfs:label ?label ;
           skos:altLabel ?altLabel .
}


```
