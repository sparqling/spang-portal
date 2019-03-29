# Get genes which highly co-express with gene

## Parameters
* `arg1`
  * default: 818614

## Endpoint
http://coxpresdb.jp/sparql

## `result`

```sparql
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX geneid: <http://identifiers.org/ncbigene/>
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX atted: <http://atted.jp/rdf/def/0.1/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?gene ?rank ?cor ?protein ?motif
WHERE {
    <http://atted.jp/rdf/db/Ath.c5-0>
          atted:gene_pair ?pair .
    ?pair atted:gene_id_1 <http://bio2rdf.org/geneid:{{arg1}}> ;
          atted:gene_id_2 ?gene ;
	  atted:mutual_rank ?rank ;
	  atted:pcc ?cor .

    # Convert Bio2RDF gene URI (http://bio2rdf.org/geneid:...)
    # to UniProt gene URI (http://purl.uniprot.org/geneid/...)
    ?gene owl:sameAs ?uniprot_gene

    # Get motifs related to highly co-expressed genes using UniProt
    SERVICE <http://sparql.uniprot.org/sparql> {
        ?protein a up:Protein ;
                 rdfs:seeAlso ?uniprot_gene ;
		 up:annotation ?annot .
        ?annot a up:Motif_Annotation ;
                 rdfs:comment ?motif .
    }
}
ORDER BY ?rank
LIMIT 20


```
