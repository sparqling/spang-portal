#    FILTER(?count >= 2)

## Parameters
* `arg1`
  * default: CompleteGenome

## Endpoint


## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX taxont: <http://ddbj.nig.ac.jp/ontologies/taxonomy/>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>

SELECT ?rank ?name ?taxid ?count
WHERE {
    {   
        SELECT ?taxid (COUNT(?genome) AS ?count)
        WHERE {
            ?genome a mbgd:{{arg1}} ;
                    # mbgd:taxon/rdfs:subClassOf* ?taxid . 
                    mbgd:inTaxon ?taxid . 
        }
    }
    ?taxid rdfs:label ?name . 
    ?taxid taxont:rank ?rank .
    VALUES ?rank { taxont:Superkingdom taxont:Kingdom taxont:Phylum taxont:Class taxont:Order taxont:Family taxont:Genus taxont:Species }
}
#ORDER BY ?name
ORDER BY DESC(?count) ?name


```
