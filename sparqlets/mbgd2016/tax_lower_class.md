# 

## Parameters
* `arg1`
  * default: 543* `arg2`
  * default: Species

## Endpoint


## `result`

```sparql
PREFIX taxont: <http://ddbj.nig.ac.jp/ontologies/taxonomy/>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX taxid: <http://identifiers.org/taxonomy/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?label ?taxon (COUNT(?genome) AS ?count)
WHERE {
    ?taxon rdfs:subClassOf+ taxid:{{arg1}} ;
           taxont:rank taxont:{{arg2}} ;
           rdfs:label ?label .
    ?genome a mbgd:CompleteGenome ;
            mbgd:inTaxon ?taxon .
}
ORDER BY DESC(?count)


```
