# Names in a specific taxonomic rank for MBGD organisms

## Parameters
* `arg1`
  * default: Superkingdom

## Endpoint


## `result`

```sparql
PREFIX taxont: <http://ddbj.nig.ac.jp/ontologies/taxonomy/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>

SELECT DISTINCT ?organism ?name
WHERE {
    VALUES (?organism) { $STDIN }
    ?organism mbgd:taxon ?taxid .
    ?taxid_new taxont:merged* ?taxid .
    ?taxid_new rdfs:subClassOf* ?ancestor .
    ?ancestor taxont:rank taxont:{{arg1}} .
    ?ancestor rdfs:label ?name .
}


```
