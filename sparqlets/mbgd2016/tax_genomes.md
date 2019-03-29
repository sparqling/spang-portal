# SELECT ?taxid ?code ?organism ?sum_genes ?sum_length ?date ?pubmed

## Parameters
* `arg1`
  * default: 2* `arg2`
  * default: CompleteGenome* `arg3`
  * default: 29* `arg4`
  * default: CompleteGenome* `arg5`
  * default: 1117* `arg6`
  * default: CompleteGenome

## Endpoint


## `result`

```sparql
PREFIX oo: <http://purl.org/net/orth#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX taxid: <http://identifiers.org/taxonomy/>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX dct: <http://purl.org/dc/terms/>

SELECT DISTINCT ?taxid ?code ?organism ?sum_genes ?sum_length ?date ?pubmed
# SELECT ?taxid ?code ?organism ?sum_genes ?sum_length ?assembly_len ?date ?pubmed
# SELECT ?taxid ?code ?organism ?sum_genes ?sum_length ?date ?pubmed (GROUP_CONCAT(?dataset ; separator=" ") AS ?datasets)
WHERE {
    ?genome a mbgd:{{arg2}} ;
        mbgd:inTaxon taxid:{{arg1}} ;
        rdfs:label ?organism ;
        mbgd:taxon ?taxid ;
        dct:identifier ?code ;
        # mbgd:assembly ?assembly ;
        # mbgd:assemblyTotalLength ?assembly_len ;
        dct:issued ?date .
    # OPTIONAL {
    #     ?dataset mbgd:organism ?genome ;
    #              a oo:OrthologyDataset .
    # }
    OPTIONAL {
	?genome dct:references ?pubmed .
    }
    {
    	SELECT ?genome (SUM(?genes) AS ?sum_genes) (SUM(?length) AS ?sum_length)
    	WHERE {
    	    ?genome mbgd:nucSeq ?seq .
    	    ?seq mbgd:geneCount ?genes ;
                 mbgd:nucLength ?length .
    	}
    }
}
# ORDER BY DESC(?sum_length)
# ORDER BY DESC(?sum_genes)
ORDER BY ?organism


```
