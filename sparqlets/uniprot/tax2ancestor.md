# TaxID to ancestor

## Parameters
* `arg1`
  * default: Phylum

## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX up: <http://purl.uniprot.org/core/>

SELECT ?taxon (COUNT(DISTINCT ?taxid) AS ?num)
WHERE {
    VALUES (?taxid) { $STDIN }
    ?taxid a up:Taxon .
    ?taxid rdfs:subClassOf+ ?ancestor .
    ?ancestor up:rank up:{{arg1}} ;
              up:scientificName ?taxon .
}
ORDER BY ?taxon


```
