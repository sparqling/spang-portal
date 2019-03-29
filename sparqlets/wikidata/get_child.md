# Get children of a specific person

## Parameters
* `arg1`
  * default: wd:Q171977

## Endpoint
https://query.wikidata.org/

## `result`

```sparql
PREFIX schema: <http://schema.org/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?child ?gender_en ?label_en ?descr_en ?birth_date ?death_date ?img
WHERE {
    {{arg1}} wdt:P40 ?child .
    OPTIONAL {
        ?child wdt:P21 ?gender .
        ?gender rdfs:label ?gender_en .
        FILTER (lang(?gender_en) = "en")
    }
    OPTIONAL {
        ?child rdfs:label ?label_en .
        FILTER (lang(?label_en) = "en")
    }
    OPTIONAL {
        ?child schema:description ?descr_en .
        FILTER (lang(?descr_en) = "en")
    }
    OPTIONAL {
        ?child wdt:P569 ?birth_date .
    }
    OPTIONAL {
        ?child wdt:P570 ?death_date .
    }
    OPTIONAL {
        ?child wdt:P18 ?img .
    }
}


```
