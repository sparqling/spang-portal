# 

## Parameters
* `arg1`
  * default: K9Z723

## Endpoint
http://sparql.uniprot.org

## `result`

```sparql
PREFIX faldo: <http://biohackathon.org/resource/faldo#>
PREFIX uniprot: <http://purl.uniprot.org/uniprot/>
PREFIX up: <http://purl.uniprot.org/core/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?annot_type ?begin_pos ?end_pos ?property ?val ?conflict_seq
WHERE {
    uniprot:{{arg1}} up:annotation ?annot .
    ?annot a ?type ;
           ?property ?val .
    ?type rdfs:label ?annot_type .
    OPTIONAL {
        ?annot up:range ?range .
        ?range faldo:begin/faldo:position ?begin_pos ;
               faldo:end/faldo:position ?end_pos .
    }
    OPTIONAL {
        ?annot up:conflictingSequence ?conflict_seq .
    }
    FILTER (?property != rdf:type && ?property != up:range && ?property != up:conflictingSequence)
}
ORDER BY ?annot_type ?begin_pos


```
