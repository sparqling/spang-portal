# Higher taxa of a NCBI taxonomy ID (ordered by taxonomic levels; only for Virtuoso)

## Parameters
* `arg1`
  * default: 511145

## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX tax: <http://purl.uniprot.org/taxonomy/>

SELECT ?taxon ?name ?rank
{
    tax:{{arg1}} up:replacedBy* ?taxid . # taxid can be replaced with a new one.
    ?taxid rdfs:subClassOf ?taxon option(transitive, t_direction 1, t_min 0, t_step("step_no") as ?level) . # only for Virtuoso
    ?taxon up:scientificName ?name .
    OPTIONAL {
        ?taxon up:rank ?rank .
    }
    # FILTER (?taxon != tax:131567) # Omit the top level "cellular organisms"
}
ORDER BY DESC(?level)


```
