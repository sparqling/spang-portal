# 

## Parameters


## Endpoint


## `result`

```sparql
PREFIX taxid: <http://identifiers.org/taxonomy/>
PREFIX taxont: <http://ddbj.nig.ac.jp/ontologies/taxonomy/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?taxid ?parent
WHERE {
    VALUES (?taxid) { $STDIN }
    # ?taxid_new taxont:merged* ?taxid  . # taxid can be replaced with a new ID
    # ?taxid_new rdfs:subClassOf ?parent .
    ?taxid rdfs:subClassOf ?parent .
    FILTER (?parent != taxid:1) # Omit the top level "root"
}


```
