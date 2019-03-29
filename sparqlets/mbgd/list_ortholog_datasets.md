# Ortholog datasets

## Parameters


## Endpoint
http://mbgd.genome.ad.jp:8047/sparql

## `result`

```sparql
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX orth: <http://purl.jp/bio/11/orth#>

# Ortholog datasets with sizes
SELECT ?dataset ?title ?organisms ?orthogroups
WHERE {
    ?dataset a orth:Dataset ;
             dct:title ?title .
    OPTIONAL {
        SELECT ?dataset (COUNT(?org) AS ?organisms)
#        SELECT ?dataset (COUNT(DISTINCT ?organism) AS ?organism_count)
        WHERE {
            ?dataset orth:organism ?org .
        }
    }
    {
        SELECT ?dataset (COUNT(?grp) AS ?orthogroups)
#        SELECT ?dataset (COUNT(DISTINCT ?orthogroup) AS ?orthogroup_count)
        WHERE {
            ?grp a orth:OrthologGroup ;
                 orth:inDataset ?dataset .
            MINUS {
                ?parent orth:member ?grp .
                { ?parent a orth:OrthologGroup }
                UNION
                { ?parent a orth:ParalogGroup }
            }
        }
    }
}
ORDER BY ?dataset


```
