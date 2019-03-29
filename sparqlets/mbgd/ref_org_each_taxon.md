# 

## Parameters
* `arg1`
  * default: extended* `arg2`
  * default: defaultOrganism* `arg3`
  * default: default* `arg4`
  * default: null

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX orth: <http://purl.jp/bio/11/orth#>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX dct: <http://purl.org/dc/terms/>

SELECT ?taxon ?ref_org_code
WHERE {
    ?ref_org ^orth:organism mbgdr:{{arg1}} ;
        dct:identifier ?ref_org_code ;
        mbgd:inTaxon ?taxon ;
        dct:issued ?min_date .
    {
        SELECT ?taxon (min(?date) AS ?min_date)
        WHERE {
            ?org ^orth:organism mbgdr:{{arg1}} ;
                  mbgd:inTaxon ?taxon ;
                  dct:issued ?date .
        }
    }
    {
        SELECT ?taxon
        WHERE {
            mbgdr:{{arg1}} orth:organism/mbgd:inTaxon ?taxon .
            MINUS { ?taxon mbgd:{{arg2}} ?default_org .}
        }
    }
}


```
