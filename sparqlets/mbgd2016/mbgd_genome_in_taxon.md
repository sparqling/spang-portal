# MBGD genomes in taxon

## Parameters


## Endpoint


## `result`

```sparql
PREFIX taxont: <http://ddbj.nig.ac.jp/ontologies/taxonomy/>
PREFIX taxid: <http://identifiers.org/taxonomy/>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?genome mbgd:inTaxon ?taxon
WHERE {
    ?genome a mbgd:Genome .
    ?genome mbgd:taxon ?taxid .
    ?taxid_new taxont:merged* ?taxid . # taxid can be replaced with a new ID
    ?taxid_new rdfs:subClassOf* ?taxon . 
    FILTER (?taxon != taxid:1) # Omit the top level "root"
    # FILTER (?taxon != taxid:1 && ?taxon != taxid:131567) # Omit the top level "root" and "cellular organisms"
}


```
