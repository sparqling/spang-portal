# 

## Parameters


## Endpoint


## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX taxid: <http://identifiers.org/taxonomy/>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX dct: <http://purl.org/dc/terms/>

#stdin taxid:543
#stdin taxid:1117
SELECT ?taxid ?code ?min_date
WHERE {
    VALUES (?taxid) { (taxid:543)
                      (taxid:1117) }
    mbgdr:default
        mbgd:organism ?ref_genome .
    ?ref_genome
        mbgd:inTaxon ?taxid ;
	dct:identifier ?code ;
	dct:issued ?min_date .
    {
	SELECT ?taxid (min(?date) AS ?min_date)
	WHERE {
	    mbgdr:default
                mbgd:organism ?genome .
	    ?genome
                mbgd:inTaxon ?taxid ;
		rdfs:label ?organism ;
		dct:issued ?date .
	}
    }
}


```
