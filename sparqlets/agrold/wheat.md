# 

## Parameters


## Endpoint
http://volvestre.cirad.fr:8890/sparql

## `result`

```sparql
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>

PREFIX taxon: <http://purl.obolibrary.org/obo/NCBITaxon_>
PREFIX graph: <http://www.southgreen.fr/agrold/protein.annotations>

SELECT distinct ?protein ?name ?evidence ?evidence_label ?evidence_code
WHERE {
 # GRAPH graph: {
    # {
     ?protein vocab:taxon taxon:4565 . # common wheat
     ?protein rdfs:label ?name .
      # {     
       # ?protein ?p obo:GO_0048364 . # mucilage pectin metabolic process
       # ?protein vocab:has_annotation ?bp.
       # ?bp rdf:subject ?protein.
       # ?bp rdf:object obo:GO_0048364 .
       # ?bp rdf:object obo:GO_0007275 .
      #  ?bp vocab:evidence_code ?evidence_code.
      #  ?bp vocab:evidence ?evidence.       
      # } UNION {
       # ?protein ?p obo:GO_2000280 . # regulation of root development
      #  ?bp rdf:subject ?protein.
      #  ?protein vocab:has_annotation ?bp. 
      #  ?bp rdf:object obo:GO_2000280.
      #  ?bp vocab:evidence_code ?evidence_code.
      #  ?bp vocab:evidence ?evidence.
      # }
    # } UNION {
     # ?protein vocab:taxon taxon:4572. # red wild einkorn wheat
     # ?protein rdfs:label ?name.
    #   {     
       # ?protein ?p obo:GO_0048364.
    #    ?protein vocab:has_annotation ?bp.
    #    ?bp rdf:subject ?protein.
    #    ?bp rdf:object obo:GO_0048364.
    #    ?bp vocab:evidence_code ?evidence_code.
    #    ?bp vocab:evidence ?evidence.       
    #   } UNION {
    #    ?protein ?p obo:GO_2000280.
    #    ?protein vocab:has_annotation ?bp. 
    #    ?bp rdf:subject ?protein.
    #    ?bp rdf:object obo:GO_2000280.
    #    ?bp vocab:evidence_code ?evidence_code.
    #    ?bp vocab:evidence ?evidence.               
    #   }    
    # }
 # }
 #    GRAPH ?g {
 #    ?evidence rdfs:label ?evidence_label.

 #    }
}


```
