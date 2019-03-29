# Datasets and their basic information

## Parameters


## Endpoint


## `result`

```sparql
define input:inference "mbgd"

PREFIX dct: <http://purl.org/dc/terms/>
PREFIX pav: <http://purl.org/pav/>
PREFIX void: <http://rdfs.org/ns/void#>

SELECT ?dataset (str(?created) AS ?date_time_created) ?title ?description ?data_dump ?derived_from
WHERE {
    ?dataset a void:Dataset .
    OPTIONAL {
        ?dataset dct:title ?title .
    }
    OPTIONAL {
        ?dataset dct:description ?description .
    }
    OPTIONAL {
        ?dataset dct:created ?created .
    }
    OPTIONAL {
        ?dataset void:dataDump ?data_dump .
    }
    OPTIONAL {
        ?dataset pav:derivedFrom ?derived_from .
    }
}
ORDER BY ?dataset


```
