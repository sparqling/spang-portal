# ORDER BY DESC(?sum_length)

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
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX taxid: <http://identifiers.org/taxonomy/>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX dct: <http://purl.org/dc/terms/>

SELECT ?code ?organism ?sum_genes ?sum_length ?date ?pubmed
WHERE {
    ?genome a mbgd:{{arg2}} ;
        mbgd:inTaxon taxid:{{arg1}} ;
        rdfs:label ?organism ;
        dct:identifier ?code ;
        dct:issued ?date .
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
# ORDER BY DESC(?sum_genes)
ORDER BY ?organism


```
