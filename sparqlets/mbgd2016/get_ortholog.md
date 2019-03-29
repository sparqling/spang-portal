# Get orthologs in UniProt IDs

## Parameters
* `arg1`
  * default: K9Z723

## Endpoint


## `result`

```sparql
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX orthology: <http://purl.org/net/orth#>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX void: <http://rdfs.org/ns/void#>

SELECT ?uniprot
WHERE {
    ?group a orthology:OrthologsCluster ;
           orthology:hasHomologous/mbgd:gene/mbgd:uniprot uniprot:{{arg1}} ;
           orthology:hasHomologous/mbgd:gene/mbgd:uniprot ?uniprot ;
           void:inDataset mbgdr:default .
}


```
