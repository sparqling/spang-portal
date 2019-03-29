# Count genes and proteins for each organism

## Parameters


## Endpoint
http://volvestre.cirad.fr:8890/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX agrold_resource: <http://www.southgreen.fr/agrold/resource/>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX agrold: <http://www.southgreen.fr/agrold/vocabulary/>

SELECT ?taxid ?taxid_label ?gene_count ?protein_count
WHERE {
    {
        SELECT ?taxid (COUNT(DISTINCT ?gene) AS ?gene_count)
        FROM <http://www.southgreen.fr/agrold/gramene.genes>
        FROM <http://www.southgreen.fr/agrold/qtaro.genes>
        FROM <http://www.southgreen.fr/agrold/msu.genes>
        FROM <http://www.southgreen.fr/agrold/rap.msu>
        WHERE {
            ?gene a agrold_resource:Gene ;
                  agrold:taxon ?taxid .
        }
    }
    {
        SELECT ?taxid (COUNT(DISTINCT ?protein) AS ?protein_count)
        FROM <http://www.southgreen.fr/agrold/uniprot.plants>
        WHERE {
            ?protein a owl:Class .
            ?protein agrold:taxon ?taxid .
        }
    }
    {
        SELECT ?taxid ?taxid_label
        WHERE {
            ?taxid rdfs:label ?taxid_label .
        }
    }
}
ORDER BY DESC(?gene_count)


```
