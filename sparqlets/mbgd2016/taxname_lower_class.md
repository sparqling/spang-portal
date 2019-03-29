# 

## Parameters
* `arg1`
  * default: Escherichia* `arg2`
  * default: Species

## Endpoint


## `result`

```sparql
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX taxont: <http://ddbj.nig.ac.jp/ontologies/taxonomy/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?label ?taxon (COUNT(?genome) AS ?count)
WHERE {
    ?taxid_new taxont:merged* ?taxid .
    ?taxid taxont:scientificName "{{arg1}}" .
    ?taxon rdfs:subClassOf+ ?taxid_new ;
           taxont:rank taxont:{{arg2}} ;
           rdfs:label ?label .
    ?genome a mbgd:CompleteGenome ;
            mbgd:inTaxon ?taxon .
}
ORDER BY DESC(?count)


```
