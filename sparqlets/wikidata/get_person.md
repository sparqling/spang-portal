# Get information of a specific person

## Parameters
* `arg1`
  * default: wd:Q171977

## Endpoint
https://query.wikidata.org/

## `result`

```sparql
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX schema: <http://schema.org/>

SELECT ({{arg1}} AS ?person) ?gender_en ?label_en ?descr_en ?birth_date ?death_date ?img
WHERE {
    OPTIONAL {
        {{arg1}} wdt:P21 ?gender .
        ?gender rdfs:label ?gender_en .
        FILTER (lang(?gender_en) = "en")
    }
    OPTIONAL {
        {{arg1}} rdfs:label ?label_en .
        FILTER (lang(?label_en) = "en")
    }
    OPTIONAL {
        {{arg1}} schema:description ?descr_en .
        FILTER (lang(?descr_en) = "en")
    }
    OPTIONAL {
        {{arg1}} wdt:P569 ?birth_date .
    }
    OPTIONAL {
        {{arg1}} wdt:P570 ?death_date .
    }
    OPTIONAL {
        {{arg1}} wdt:P18 ?img .
    }
}


```
