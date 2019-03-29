# 

## Parameters


## Endpoint


## `result`

```sparql
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX org: <http://mbgd.genome.ad.jp/rdf/resource/organism/>
PREFIX taxont: <http://ddbj.nig.ac.jp/ontologies/taxonomy/>

#stdin org:eco
#stdin org:bsu
SELECT ?code ?phylum ?organism ?seq_label ?genes ?length ?date ?pubmed
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
    ?genome mbgd:nucSeq ?seq .
    ?seq mbgd:geneCount ?genes ;
         rdfs:label ?seq_label ;
         mbgd:nucLength ?length .
}
ORDER BY ?phylum ?organism ?seq_label


```
