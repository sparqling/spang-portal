# Get orthologs of a specific protein

## Parameters
* `arg1`
  * default: ENSLACG00000002497

## Endpoint
https://sparql.omabrowser.org/sparql

## `result`

```sparql
PREFIX oo: <http://purl.org/net/orth#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX ens: <http://rdf.ebi.ac.uk/resource/ensembl/>

PREFIX lscr: <http://purl.org/lscr#>
PREFIX ens: <http://rdf.ebi.ac.uk/resource/ensembl/>
SELECT ?ortholog_protein ?OMA_link 
WHERE {
    ?cluster a oo:OrthologsCluster ;
             oo:hasHomologousMember ?node1 ;
             oo:hasHomologousMember ?node2 . 
    ?node1 oo:hasHomologousMember* ?query_protein .
    ?node2 oo:hasHomologousMember* ?ortholog_protein .
    FILTER(?node1 != ?node2) 
    ?query_protein sio:SIO_010079/lscr:xrefEnsemblGene ens:{{arg1}} .
    ?ortholog_protein rdfs:seeAlso ?OMA_link . 
}


```
