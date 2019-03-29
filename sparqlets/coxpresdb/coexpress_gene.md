# Get genes that co-express with gene (NCBI Gene ID)

## Parameters
* `arg1`
  * default: 10001* `arg2`
  * default: coxpresdb

## Endpoint
http://coxpresdb.jp/sparql

## `result`

```sparql
PREFIX geneid: <http://identifiers.org/ncbigene/>

SELECT ?gene ?rank ?cor
WHERE {
    <http://coxpresdb.jp/rdf/db/Hsa.v12>
          {{arg2}}:gene_pair ?pair .
    ?pair {{arg2}}:gene_id_1 <http://bio2rdf.org/geneid:{{arg1}}> ;
          {{arg2}}:gene_id_2 ?gene ;
          {{arg2}}:mutual_rank ?rank ;
          {{arg2}}:pcc ?cor .
}
ORDER BY ?rank


```
