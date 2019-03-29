# ORDER BY DESC(?sum_length)

## Parameters


## Endpoint


## `result`

```sparql
PREFIX org: <http://mbgd.genome.ad.jp/rdf/resource/organism/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX taxont: <http://ddbj.nig.ac.jp/ontologies/taxonomy/>

#stdin org:eco
#stdin org:bsu
SELECT ?code ?phylum ?organism ?sum_genes ?sum_length ?date ?pubmed
WHERE {
    VALUES (?genome) { (org:eco)
                       (org:bsu) }
    ?genome
        rdfs:label ?organism ;
        dct:identifier ?code ;
        mbgd:inTaxon ?tax_phylum ;
        dct:issued ?date .
    ?tax_phylum taxont:rank taxont:Phylum ;
        rdfs:label ?phylum .
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
ORDER BY ?phylum ?organism


```
