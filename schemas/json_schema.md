# JSON Schema for Tracks

# General principles

We will add what the standards for this schema are e.g. consistent use of case in keys, no reuse of keys unless they have the same meaning.

# The Schema

```json
{
  "short_name" : "GENCODE M24",
  "long_name" : "GENCODE gene set for Mouse Build 24",
  "description" : "The gencode gene set is ...",
  "location" : {
    "location_type" : "mysql",
    "location_object_type" : "gene",
    "location_species" : "mus_musculus",
    "location_dbtype" : "core",
    "location_logic_names" : ["ensembl"]
  },
}
```

# Keys and meaning

|Key|Meaning|Type|Parent|Required|Example|
----|-------|----|------|--------|-------|
| `short_name` | A short string used to describe a track in space limited situations  | String | - | Yes | `GENCODE M24`|
| `long_name` | A long string used to describe a track  | String | - | Yes | `GENCODE Gene set for Mouse Build 24`|
| `description` | Full track description used in interfaces  | String | - | Yes | `The GENCODE gene set is a ...`|
| `location` | A hash used to describe the location of a track e.g. URL, MySQL | Hash | - | Yes | `"location" : {} `|
| `location_type` | The location type | Enum(mysql,uri) | Location | Optional | `mysql`|
| `location_object_type` | The type of object being retrieved (an internal Ensembl type not a track type) | String | - | Yes | `gene`|
| `location_species` | The species a track is held in (an internal Ensembl species) | String | - | Yes | `mus_musuculus`|
| `location_dbtype` | The database type the track is held in | String | - | Yes | `core`|
| `location_logic_names` | A set of analysis logic names used to find track data in a core database | Array[String] | - | Yes | `ensembl`|
| `a` | A  | String | - | Yes | `a`|
| `a` | A  | String | - | Yes | `a`|

# Versioning
