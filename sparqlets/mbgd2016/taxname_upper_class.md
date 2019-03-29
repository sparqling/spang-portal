# 

## Parameters
* `arg1`
  * default: 543* `arg2`
  * default: Escherichia

## Endpoint


## `result`

```sparql
PREFIX taxont: <http://ddbj.nig.ac.jp/ontologies/taxonomy/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX taxid: <http://identifiers.org/taxonomy/>

SELECT ?rank ?label ?taxon
WHERE {
    # ?taxid_new taxont:merged* taxid:{{arg1}} . # taxid can be replaced with a new ID
    ?taxid_new taxont:merged* ?taxid .
    ?taxid taxont:scientificName "{{arg1}}" .
    ?taxid_new rdfs:subClassOf ?taxon option(transitive, t_direction 1, t_min 1, t_step("step_no") as ?level) . # only for Virtuoso
    ?taxon taxont:rank ?rank .
    ?taxon rdfs:label ?label .
    VALUES ?rank { taxont:Superkingdom taxont:Kingdom taxont:Phylum taxont:Class taxont:Order taxont:Family taxont:Genus taxont:Species }
}
ORDER BY DESC(?level)


```
