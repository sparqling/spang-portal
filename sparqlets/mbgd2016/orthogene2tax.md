# 

## Parameters
* `arg1`
  * default: psbA

## Endpoint


## `result`

```sparql
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX void: <http://rdfs.org/ns/void#>
PREFIX orthology: <http://purl.org/net/orth#>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>

SELECT ?taxon
WHERE {
    ?cluster a orthology:OrthologsCluster ;
        void:inDataset mbgdr:default ;
	rdfs:label "{{arg1}}" ;
	orthology:hasHomologous ?member .
    ?member mbgd:organism/mbgd:taxon ?taxon .
}


```
