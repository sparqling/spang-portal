# Taxonomic hierarchy for

## Parameters
* `arg1`
  * default: eco

## Endpoint


## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX org: <http://mbgd.genome.ad.jp/rdf/resource/organism/>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX taxont: <http://ddbj.nig.ac.jp/ontologies/taxonomy/>
PREFIX taxid: <http://identifiers.org/taxonomy/>

SELECT ?taxon ?name ?rank
{
    org:{{arg1}} mbgd:taxon ?taxid .
    ?taxid_new taxont:merged* ?taxid  . # taxid can be replaced with a new ID
    ?taxid_new rdfs:subClassOf ?taxon option(transitive, t_direction 1, t_min 0, t_step("step_no") as ?level) . # only for Virtuoso
    ?taxon rdfs:label ?name .
    ?taxon taxont:rank ?rank .
    FILTER (?taxon != taxid:1) # Omit the top level "root"
    # FILTER (?taxon != taxid:131567) # Omit the top level "cellular organisms"
}
ORDER BY DESC(?level)


```
