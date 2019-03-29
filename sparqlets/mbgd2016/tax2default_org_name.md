# 

## Parameters


## Endpoint


## `result`

```sparql
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>

SELECT DISTINCT ?taxon ?org ?org_label
WHERE {
    VALUES (?taxon) { $STDIN }
    mbgdr:default mbgd:organism ?org .
    ?org a mbgd:Genome .
    ?org mbgd:inTaxon ?taxon .
    ?org rdfs:label ?org_label .
}


```
