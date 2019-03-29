# Taxonomic hierarchy for

## Parameters
* `arg1`
  * default: eco

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX org: <http://mbgd.genome.ad.jp/rdf/resource/organism/>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX tax: <http://purl.uniprot.org/taxonomy/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?taxon ?name ?rank
{
    org:{{arg1}} orth:taxon ?tax_org .
    ?tax_org up:replacedBy* ?taxid . # taxid can be replaced with a new ID
    ?taxid rdfs:subClassOf ?taxon option(transitive, t_direction 1, t_min 0, t_step("step_no") as ?level) . # only for Virtuoso
    ?taxon up:scientificName ?name .
    OPTIONAL {
        ?taxon up:rank ?rank .
    }
    # FILTER (?taxon != tax:131567) # Omit the top level "cellular organisms"
}
ORDER BY DESC(?level)


```
