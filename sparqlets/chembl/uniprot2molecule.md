# Get molecule from target UniProt ID

## Parameters


## Endpoint
http://www.ebi.ac.uk/rdf/services/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX chembl: <http://rdf.ebi.ac.uk/terms/chembl#>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>

#stdin uniprot:Q05397
SELECT DISTINCT ?uniprot ?molecule ?molecule_label
WHERE {
    ?act chembl:hasAssay/chembl:hasTarget/chembl:hasTargetComponent/chembl:targetCmptXref ?uniprot .
    ?act chembl:hasMolecule ?molecule .
    ?molecule rdfs:label ?molecule_label .
    VALUES (?uniprot) { (uniprot:Q05397) }
}


```
