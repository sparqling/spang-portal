# 

## Parameters
* `arg1`
  * default: CHEMBL941

## Endpoint
http://www.ebi.ac.uk/rdf/services/sparql

## `result`

```sparql
PREFIX chembl: <http://rdf.ebi.ac.uk/terms/chembl#>
PREFIX chemblMol: <http://rdf.ebi.ac.uk/resource/chembl/molecule/>

SELECT DISTINCT ?uniprot
WHERE {
    ?act chembl:hasMolecule chemblMol:{{arg1}} .
    ?act chembl:hasAssay/chembl:hasTarget/chembl:hasTargetComponent/chembl:targetCmptXref ?uniprot .
    ?uniprot a chembl:UniprotRef .
}


```
