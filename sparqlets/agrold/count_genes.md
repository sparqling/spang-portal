# Count genes for each organism

## Parameters


## Endpoint
http://volvestre.cirad.fr:8890/sparql

## `result`

```sparql
PREFIX agrold: <http://www.southgreen.fr/agrold/vocabulary/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX agrold_resource: <http://www.southgreen.fr/agrold/resource/>

SELECT ?taxid ?taxid_label (COUNT(DISTINCT ?gene) AS ?gene_count)
FROM <http://www.southgreen.fr/agrold/gramene.genes>
FROM <http://www.southgreen.fr/agrold/qtaro.genes>
FROM <http://www.southgreen.fr/agrold/msu.genes>
FROM <http://www.southgreen.fr/agrold/rap.msu>
FROM <http://www.southgreen.fr/agrold/ncbitaxon>
WHERE {
    ?gene a agrold_resource:Gene ;
          agrold:taxon ?taxid .
    ?taxid rdfs:label ?taxid_label .
}
ORDER BY DESC(?gene_count)


```
