# List genes of a MBGD organism

## Parameters
* `arg1`
  * default: eco

## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX org: <http://mbgd.genome.ad.jp/rdf/resource/organism/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX orth: <http://purl.jp/bio/11/orth#>

SELECT ?gene ?label ?type ?description
{
    ?type rdfs:subClassOf orth:Gene .
    ?gene a ?type ;
          orth:organism org:{{arg1}} .
    OPTIONAL {
	?gene rdfs:label ?label .
    }
    OPTIONAL {
	?gene dct:description ?description .
    }
}
ORDER BY ?gene


```
