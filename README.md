# Google Summer of Code 2017
## Final Work Product Submission Report

### Introduction

Ensembl is a data warehousing and data sets project which helps to analyse advanced biological data. Simple this application displays a 1 dimensional map of a chromosomal region and then the stacks annotations on top of it. So scientists can configure these images and add/remove tracks at will to highlight biological features of interest.

This is a brief introduction on the project which is currently in use in Ensembl project. The main goal of this project is to develop a database to store above mentioned tracks and also implement a REST API to search the tracks. And also an administration panel to manage(search) all the tracks and all other inside scripting and all.

### What work was done ?

This project contains 3 major parts. So i managed to develope all the 3 parts seperately in order to ease of development and also deployment. Here are those 3 parts.

1. Ensembl-UI (https://github.com/chanakaDe/ensembl-ui)
2. Ensembl OLD to New Database Converter (https://github.com/chanakaDe/ensembl-db-convert)
3. Ensembl Elastic Rest API (https://github.com/chanakaDe/ensembl-elastic-rest-final)

All the information about how to run, develop and also deploy are available on each repository seperately.

#### When using Elastic-Search, this is the JOSN object you need to use : 

- [JSON Schema description](https://github.com/Ensembl/chanaka-gsoc-2017/blob/master/schemas/json_schema.md)

### Current State of the Project

All the main 3 components are finish according to the plan and ready to use. As I mentioned earlier, each project repository has seperate instructions on how to run these applications. `Ensembl OLD to New Database Converter` and `Ensembl Elastic Rest API` are back end applications and `Ensembl-UI` is the component which users are interacting with. So here's how we have to use it.

![Ensembl-UI](https://github.com/EnsemblGSOC/chanaka-gsoc-2017/blob/master/Ensembl-UI-Demo.png "Ensembl-UI")







