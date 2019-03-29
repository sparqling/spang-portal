# Taxonomic hierarchy for

## Parameters
* `arg1`
  * default: 511145

## Endpoint


## `result`

```sparql
PREFIX taxont: <http://ddbj.nig.ac.jp/ontologies/taxonomy/>
PREFIX taxid: <http://identifiers.org/taxonomy/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?taxon ?name ?rank
{
    ?taxid_new taxont:merged* taxid:{{arg1}} . # taxid can be replaced with a new ID
    ?taxid_new rdfs:subClassOf ?taxon option(transitive, t_direction 1, t_min 0, t_step("step_no") as ?level) . # only for Virtuoso
    ?taxon rdfs:label ?name .
    ?taxon taxont:rank ?rank .
    # FILTER (?taxon != taxid:1 && ?taxon != taxid:131567) # Omit the top level "root" and "cellular organisms"
}
ORDER BY DESC(?level)


```
