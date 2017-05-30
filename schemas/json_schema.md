# JSON Schema for Tracks

# General principles

We will add what the standards for this schema are e.g. consistent use of case in keys, no reuse of keys unless they have the same meaning.

# The Schema

```json
{
  "short_name" : "GENCODE M24",
  "long_name" : "GENCODE gene set for Mouse Build 24",
  "description" : "The gencode gene set is ...",
  "track_type" : "gene",
  "genome" : {
    "genome_species" : "mus_musculus",
    "genome_assembly" : "GRCm38",
    "genome_strain" : False,
  },
  "release" : {
    "release_division" : "ensembl",
    "release_version" : 89
  },
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

Below is the specification of the various keys and values for the above schema.

## Top Level

|Key|Meaning|Type|Parent|Required|Example|
----|-------|----|------|--------|-------|
| `short_name` | A short string used to describe a track in space limited situations  | String | Yes | `GENCODE M24`|
| `long_name` | A long string used to describe a track  | String | Yes | `GENCODE Gene set for Mouse Build 24`|
| `description` | Full track description used in interfaces | String | Yes | `The GENCODE gene set is a ...`|
| `track_type` | The type of track this data represents. Is a soft enum i.e. user defined and can be anything but very strict in its selection criteria | String | Yes | `gene`|
| `genome` | Hash used to describe the genome this track should be viewed on | Hash | Yes | `"genome" : {} `|
| `release` | Describes the Ensembl release the track was available in | Hash | Yes | `"release" : {} `|
| `location` | A hash used to describe the location of a track e.g. URL, MySQL | Hash | Yes | `"location" : {} `|

## Genome

|Key|Meaning|Type|Required|Example|
----|-------|----|--------|-------|
| `genome_species` | The species for a genome | String | Yes | `homo_sapiens`|
| `genome_assembly` | The assembly version for a given genome | String | Yes | `GRCm38`|
| `genome_strain` | Boolean used to flag if a genome is a strain or not | Boolean | Yes | `True`|

## Release

|Key|Meaning|Type|Required|Example|
----|-------|----|--------|-------|
| `release_division` | The Ensembl division a track was found in. Currently an enum but can be set to any division name | Enum(ensembl, plants, bacteria, protists, funghi, metazoa) | Yes | `ensembl` |
| `release_version` | Release version of the Ensembl site used | Integer | Yes | 89 |

## Location

The following keys are used to help to locate the data in question for a track. Currently this could be in an Ensembl MySQL core schema or from a URI (available over a supported protocol e.g. HTTP, FTP, file).

|Key|Meaning|Type|Required|Example|
----|-------|----|--------|-------|
| `location_type` | The location type | Enum(mysql,uri) | Yes | `mysql` |
| `location_object_type` | The type of object being retrieved (an internal Ensembl type not a track type) | String | Yes (if location type is set to mysql) | `gene`|
| `location_species` | The species a track is held in (an internal Ensembl species) | String | Yes (if location type is set to mysql) | `mus_musuculus`|
| `location_dbtype` | The database type the track is held in | String | Yes (if location type is set to mysql) | `core`|
| `location_logic_names` | A set of analysis logic names used to find track data in a core database | Array[String] | Yes (if location type is set to mysql) | `ensembl`|
| `location_uri` | URI to the path of the track data | String | Yes (if location type is set to uri) | `http://www.ebi.ac.uk/~ayates/example_big_files/Homo_sapiens.GRCh37.constrained_element.bb` or `file:///path/to/file/Homo_sapiens.GRCh37.constrained_element.bb` |

# Versioning

