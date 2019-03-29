# Get molecule from target UniProt ID

## Parameters
* `arg1`
  * default: Q05397

## Endpoint
http://www.ebi.ac.uk/rdf/services/sparql

## `result`

```sparql
PREFIX chembl: <http://rdf.ebi.ac.uk/terms/chembl#>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT DISTINCT ?chembl ?label
WHERE {
    ?act chembl:hasAssay/chembl:hasTarget/chembl:hasTargetComponent/chembl:targetCmptXref uniprot:{{arg1}} .
    ?act chembl:hasMolecule ?chembl .
    ?chembl rdfs:label ?label .
}


```
