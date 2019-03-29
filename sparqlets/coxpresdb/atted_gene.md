# Get genes that co-express with gene (NCBI Gene ID)

## Parameters
* `arg1`
  * default: 818614

## Endpoint
http://coxpresdb.jp/sparql

## `result`

```sparql
PREFIX geneid: <http://identifiers.org/ncbigene/>
PREFIX atted: <http://atted.jp/rdf/def/0.1/>

SELECT ?gene ?rank ?cor
WHERE {
    <http://atted.jp/rdf/db/Ath.c5-0>
          atted:gene_pair ?pair .
    ?pair atted:gene_id_1 <http://bio2rdf.org/geneid:{{arg1}}> ;
          atted:gene_id_2 ?gene ;
          atted:mutual_rank ?rank ;
          atted:pcc ?cor .
}
ORDER BY ?rank


```
