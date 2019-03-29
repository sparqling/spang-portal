# SELECT DISTINCT ?gene_id ?begin ?end ?motif_name ?e_value

## Parameters
* `arg1`
  * default: TIGR

## Endpoint


## `result`

```sparql
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX dct: <http://purl.org/dc/terms/>

#stdin <http://mbgd.genome.ad.jp/rdf/resource/gene/puf:UFO1_RS15575>
SELECT DISTINCT ?gene_id ?begin ?end ?motif_id ?e_value
WHERE {
    VALUES (?gene) { (<http://mbgd.genome.ad.jp/rdf/resource/gene/puf:UFO1_RS15575>) }
    ?motif_hit mbgd:motifType "{{arg1}}";
        mbgd:gene ?gene ;
	mbgd:begin ?begin ;
	mbgd:end ?end ;
	mbgd:motifId ?motif_id ;
	# mbgd:motifName ?motif_name ;
	mbgd:eValue ?e_value .
    ?gene
        dct:identifier ?gene_id .
}
ORDER BY ?gene ?begin ?end


```
