# Count TaxIDs under a given TaxID

## Parameters
* `arg1`
  * default: 511145

## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX tax: <http://purl.uniprot.org/taxonomy/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT COUNT(?taxon)
# SELECT ?taxon
{
    ?taxon rdfs:subClassOf+ tax:{{arg1}} .
    # MINUS {
    # 	?child rdfs:subClassOf ?taxon .
    # }
}


```
