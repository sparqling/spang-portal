# Get ortholog in specific taxa from Ensembl gene ID

## Parameters
* `arg1`
  * default: ENSG00000139618

## Endpoint
http://www.ebi.ac.uk/rdf/services/sparql

## `result`

```sparql
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX ens: <http://rdf.ebi.ac.uk/resource/ensembl/>
PREFIX taxid: <http://identifiers.org/taxonomy/>

#stdin taxid:10090
#stdin taxid:10116
SELECT ?query ?query_label ?label ?altLabel ?taxon ?ensgene ?ensgene_label ?gene
WHERE {
    # ens:{{arg1}} sio:SIO_000558 ?ensgene .
    ?query sio:SIO_000558 ?ensgene .
    ?query rdfs:label ?query_label .
    ?ensgene obo:RO_0002162 ?taxon .
    ?ensgene rdfs:label ?ensgene_label .
    ?ensgene rdfs:seeAlso ?gene .
    ?gene a <http://identifiers.org/ncbigene> .
    ?taxon rdfs:label ?label ;
           skos:altLabel ?altLabel .
    VALUES (?query) { (ens:{{arg1}}) }
    VALUES (?taxon) { (taxid:10090)
                      (taxid:10116) }
}


```
