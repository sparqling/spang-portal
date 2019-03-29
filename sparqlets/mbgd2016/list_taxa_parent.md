# 

## Parameters
* `arg1`
  * default: CompleteGenome

## Endpoint


## `result`

```sparql
PREFIX taxont: <http://ddbj.nig.ac.jp/ontologies/taxonomy/>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT DISTINCT ?taxid ?taxon
WHERE {
    ?genome a mbgd:{{arg1}} ;
            mbgd:inTaxon ?taxid . 
    ?taxid rdfs:label ?name ;
           taxont:rank ?rank .
    ?taxid rdfs:subClassOf ?taxon option(transitive, t_direction 1, t_min 1, t_step("step_no") as ?level) . # only for Virtuoso
    ?taxon taxont:rank ?upper_rank .
    VALUES ?rank { taxont:Kingdom taxont:Phylum taxont:Class taxont:Order taxont:Family taxont:Genus taxont:Species }
    VALUES ?upper_rank { taxont:Superkingdom taxont:Kingdom taxont:Phylum taxont:Class taxont:Order taxont:Family taxont:Genus }
}
ORDER BY ?taxid ?level


```
