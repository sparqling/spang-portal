# Gene content comparison (between 2 taxa)

## Parameters
* `arg1`
  * default: 543* `arg2`
  * default: 186817* `arg3`
  * default: 0.8* `arg4`
  * default: 0.2

## Endpoint


## `result`

```sparql
PREFIX void: <http://rdfs.org/ns/void#>
PREFIX taxid: <http://identifiers.org/taxonomy/>
PREFIX mbgd: <http://purl.jp/bio/11/mbgd#>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX faldo: <http://biohackathon.org/resource/faldo#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX mgfo: <http://purl.jp/bio/11/mgfo#>
PREFIX mbgdr: <http://mbgd.genome.ad.jp/rdf/resource/>
PREFIX oo: <http://purl.org/net/orth#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

PREFIX mgfo: <http://purl.jp/bio/11/mgfo#>
SELECT ?group ?ratio ?ratio2 ?ref_gene
WHERE {
    ?ref_gene dct:identifier ?ref_gene_id ;
          mbgd:nucSeq/rdfs:label ?chrom_label ;
          mbgd:nucSeq/rdfs:seeAlso ?chrom_id .
          # faldo:location/faldo:begin/faldo:position ?begin ;
          # faldo:location/faldo:end/faldo:position ?end .
    ?group mgfo:funcMBGD ?exact_func .
    {
        SELECT ?group ?ratio ?ratio2 ?ref_gene
        WHERE {
            ?group a oo:OrthologsCluster ;
                   void:inDataset mbgdr:default ;
                   oo:hasHomologous/mbgd:gene ?ref_gene .
            ?ref_gene mbgd:organism/^mbgd:defaultOrganism taxid:{{arg1}} .
            OPTIONAL
            {
                SELECT ?group (COUNT(DISTINCT ?organism) AS ?count)
                WHERE {
                    ?group oo:hasHomologous/mbgd:organism ?organism .
                    ?organism mbgd:inTaxon taxid:{{arg1}} .
                }
            }
            {
                SELECT (COUNT(?organism_all) AS ?count_organism_all)
                WHERE {
                    ?organism_all mbgd:inTaxon taxid:{{arg1}} ;
                                 ^mbgd:organism mbgdr:default .
                }
            }
            OPTIONAL
            {
                SELECT ?group (COUNT(DISTINCT ?organism2) AS ?count2)
                WHERE {
                    ?group oo:hasHomologous/mbgd:organism ?organism2 .
                    ?organism2 mbgd:inTaxon taxid:{{arg2}} .
                }
            }
            {
                SELECT (COUNT(?organism_all2) AS ?count_organism_all2)
                WHERE {
                    ?organism_all2 mbgd:inTaxon taxid:{{arg2}} ;
                                  ^mbgd:organism mbgdr:default .
                }
            }
            BIND (IF(BOUND(?count), ?count, 0) AS ?count_or_0)
            BIND (IF(BOUND(?count2), ?count2, 0) AS ?count2_or_0)
            BIND ((xsd:decimal(?count_or_0)/?count_organism_all) AS ?ratio)
            BIND ((xsd:decimal(?count2_or_0)/?count_organism_all2) AS ?ratio2)
        }
        ORDER BY ?ratio2 DESC(?ratio)
    }
    FILTER (?ratio >= {{arg3}})
    FILTER (?ratio2 <= {{arg4}})
}


```
