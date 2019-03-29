# 

## Parameters


## Endpoint


## `result`

```sparql
PREFIX eco: <http://mbgd.genome.ad.jp/rdf/resource/gene/eco:>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

#stdin eco:B0002
SELECT DISTINCT ?s ?label ?descr
WHERE {
    VALUES (?s) { (eco:B0002) }
    ?s rdfs:label ?label ;
       dct:description ?descr .
}


```
