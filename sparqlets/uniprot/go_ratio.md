# Set of UniProt IDs to GO annotations with ratio

## Parameters


## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX taxid: <http://identifiers.org/taxonomy/>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX goa: <http://purl.jp/bio/11/goa#>

SELECT ?count ?count_all ((xsd:decimal(?count)/?count_all) AS ?ratio) ?go ?go_label
WHERE {
    ?go skos:prefLabel ?go_label .
    {
        SELECT (COUNT(?uniprot_all) AS ?count_all) ?go
        WHERE {
	    ?gene mbgd:taxon taxid:9606 ;
	          mbgd:uniprot ?uniprot_all .
            ?uniprot_all goa:goa ?go .
        }
    }
    {
        SELECT (COUNT(?uniprot) AS ?count) ?go
        WHERE {
            VALUES (?uniprot) { $STDIN }
            ?uniprot goa:goa ?go .
    	}
    }
}
ORDER BY DESC(?ratio)


```
