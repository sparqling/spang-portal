# 

## Parameters


## Endpoint
http://dbpedia.org/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dbpedia: <http://dbpedia.org/resource/>

#stdin dbpedia:Escherichia
#stdin dbpedia:Escherichia_coli
#stdin dbpedia:Salmonella
SELECT ?dbpedia_resource ?label
WHERE {
    VALUES (?dbpedia_resource) { (dbpedia:Escherichia)
                                 (dbpedia:Escherichia_coli)
                                 (dbpedia:Salmonella) }
    ?dbpedia_resource rdfs:label ?label .
    FILTER(lang(?label) = "ja")
}


```
