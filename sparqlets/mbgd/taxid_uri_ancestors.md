# Taxonomic hierarchy for

## Parameters
* `arg1`
  * default: taxid:511145

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX taxont: <http://ddbj.nig.ac.jp/ontologies/taxonomy/>
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX taxid: <http://identifiers.org/taxonomy/>

SELECT ?taxon ?name ?rank
{
    {{arg1}} up:replacedBy* ?taxid . # taxid can be replaced with a new ID
    ?taxid rdfs:subClassOf ?taxon option(transitive, t_direction 1, t_min 0, t_step("step_no") as ?level) . # only for Virtuoso
    ?taxon rdfs:label ?name .
    OPTIONAL {
        ?taxon taxont:rank ?rank .
    }
    # FILTER (?taxon != taxid:131567) # Omit the top level "cellular organisms"
}
ORDER BY DESC(?level)


```
