# List of dataset

## Parameters


## Endpoint
http://coxpresdb.jp/sparql

## `result`

```sparql
PREFIX coxpresdb: <http://coxpresdb.jp/rdf/def/0.1/>

SELECT ?graph ?dataset ?n_genes
WHERE {
    {
        SELECT DISTINCT ?graph ?dataset
        WHERE {
            GRAPH ?graph {
                ?dataset coxpresdb:gene_pair ?o .
            }
        }
    }
    {
        SELECT ?dataset (COUNT(?o) AS ?n_genes)
        WHERE {
            ?dataset coxpresdb:gene_id ?o .
        }
    }
}
ORDER BY DESC(?n_genes)


```
