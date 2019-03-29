# Count proteins for each organism

## Parameters


## Endpoint
http://volvestre.cirad.fr:8890/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX agrold: <http://www.southgreen.fr/agrold/vocabulary/>

SELECT ?taxid ?taxid_label (COUNT(?protein) AS ?protein_count)
FROM <http://www.southgreen.fr/agrold/uniprot.plants>
FROM <http://www.southgreen.fr/agrold/ncbitaxon>
WHERE {
    ?protein agrold:taxon ?taxid .
    ?taxid rdfs:label ?taxid_label .
}
ORDER BY DESC(?protein_count)


```
