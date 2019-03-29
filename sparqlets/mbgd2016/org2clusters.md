# 

## Parameters


## Endpoint


## `result`

```sparql
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX org: <http://mbgd.genome.ad.jp/rdf/resource/organism/>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX void: <http://rdfs.org/ns/void#>
PREFIX oo: <http://purl.org/net/orth#>

#stdin org:eco
#stdin org:bsu
SELECT ?organism GROUP_CONCAT(?cluster_id; separator=" ")
WHERE {
    ?cluster a oo:OrthologsCluster ;
             void:inDataset mbgdr:default ;
             dct:identifier ?cluster_id ;
             oo:hasHomologous ?gene .
    ?gene a oo:Gene ;
          mbgd:organism ?organism .
    VALUES (?organism) { (org:eco)
                         (org:bsu) }
    VALUES (?cluster_id) { ("1025") ("1") ("10") }
}


```
