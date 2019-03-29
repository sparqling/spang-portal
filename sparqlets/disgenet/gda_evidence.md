# Get specific gda, e.g. NCBI gene ID 4204 and C0035372("Rett Syndrome")

## Parameters


## Endpoint
http://rdf.disgenet.org/sparql/

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX pmid: <http://identifiers.org/pubmed/>
PREFIX sio: <http://semanticscience.org/resource/>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX umls: <http://linkedlifedata.com/resource/umls/id/>
PREFIX geneid: <http://identifiers.org/ncbigene/>
PREFIX up: <http://purl.uniprot.org/core/>

PREFIX pmid: <http://identifiers.org/pubmed/>
PREFIX disgenet_source: <http://rdf.disgenet.org/v4.0.0/void/>

SELECT ?gda ?score ?type ?label ?source ?pmid ?description
WHERE {
    ?gda sio:SIO_000628 umls:C0035372 ,
                        geneid:4204 ;
         a ?type ;
         # up:organism ?tax ;
         sio:SIO_000253 ?source ;
         sio:SIO_000216/sio:SIO_000300 ?score .
    ?type rdfs:label ?label .
    OPTIONAL {
	?gda sio:SIO_000772 ?pmid .
    }
    OPTIONAL {
	?gda dct:description ?description .
    }
}
ORDER BY DESC(?score) ?source ?pmid


```
