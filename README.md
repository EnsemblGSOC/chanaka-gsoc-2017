# Google Summer of Code 2017
## Final Work Product Submission Report

### Introduction

Ensembl is a data warehousing and data sets project which helps to analyse advanced biological data. Simple this application displays a 1 dimensional map of a chromosomal region and then the stacks annotations on top of it. So scientists can configure these images and add/remove tracks at will to highlight biological features of interest.

This is a brief introduction on the project which is currently in use in Ensembl project. The main goal of this project is to develop a database to store above mentioned tracks and also implement a REST API to search the tracks. And also an administration panel to manage(search) all the tracks and all other inside scripting and all.

### What work was done ?

This project contains 3 major parts. So i managed to develope all the 3 parts seperately in order to ease of development and also deployment. Here are those 3 parts.

1. Ensembl OLD to New Database Converter (https://github.com/chanakaDe/ensembl-db-convert)
2. Ensembl Elastic Rest API (https://github.com/chanakaDe/ensembl-elastic-rest-final)
3. Ensembl-UI (https://github.com/chanakaDe/ensembl-ui)

All the information about how to run, develop and also deploy are available on each repository seperately.

##### Here I'm going to give a brief description on all these 3 components and how they are linked together.

#### Ensembl OLD to New Database Converter

Before starting any of the components, we need to run this project and convert all the old mysql data into new data schema. The main goal of this application is to populate the new MySQL schema. This new schema is used to add JSON documents into the Elastic server. This is a standalone application and no need to deploy on a server. You can clone this application, and you need to follow all the instruction given in the documentation and run it. Make sure you set up this project and import all the data into new database before setting up next 2 projects.

#### Ensembl Elastic Rest API

This is the 2nd most important component of this project. Once you run the first application, you have a database with new schema and full of data. Then all you have to do is run this application according to the instructions given. This application has two tasks. They are mentioned below:

1. Populate Elastic Search instance with New MySQL data
2. Expose Elastic Search search results as REST end points (Provide a RESTful infrastructure to users)

This is an open REST API and anyone can access it. For now this REST end points are used in `Ensembl-UI` and can be used in any kind of client including Android application, iOS application, Windows application or any web application.

#### Ensembl-UI

This is the project component which users interacting directly. Once you set up `Ensembl Elastic Rest API` , you can deploy this application by providing the hosting details of REST API. All the instructions are provided in the official documentation of the project. This application mainly used to query through Elastic Search Tracks. Users can search via 5 main parameters. And can get a list of tracks according to the search parameters. 

In my example, this application is hosted using Heroku and can be hosted using any type of server. After you build the application, it become a simple HTML application which is easy to manage and deploy. So can be hosted as a PHP application or direct HTML 5 application.

#### When using Elastic-Search, this is the JOSN object you need to use : 

- [JSON Schema description](https://github.com/Ensembl/chanaka-gsoc-2017/blob/master/schemas/json_schema.md)

### Current State of the Project

All the main 3 components are finish according to the plan and ready to use. As I mentioned earlier, each project repository has seperate instructions on how to run these applications. `Ensembl OLD to New Database Converter` and `Ensembl Elastic Rest API` are back end applications and `Ensembl-UI` is the component which users are interacting with. So here's how we have to use it.

As for now, we only have tracks for type `gene` only. So you have to search only that track type as shown in the image. And also when searching the input field `Free Text Search` is mandetory. And other filed,you can leave empty. And also all these applications are hosted in free testing servers. So sometimes performance can be little slow when searching new tracks.

![Ensembl-UI](https://github.com/EnsemblGSOC/chanaka-gsoc-2017/blob/master/Ensembl-UI-Demo.png "Ensembl-UI")

### How we managed the project and all it's components in a effective way

To manage all the tasks and new developments, we used Github issues and to better use of issues tracker, we used Milestones to manage specific list of issues. So basically we (me and my mentors) had 3 months to finish this project. Main project contains 3 sub projects as I mentioned earlier. So we had 3 different Milestones for each coding period. That's a really effective way of managing the project. Mentors can add any kind of issue of the project and i can follow it and fix it. Not as sending emails and chats, issues are there and we never miss them to fix.

Now all the 3 main stages are finished and all milestones are finished now.

https://github.com/EnsemblGSOC/chanaka-gsoc-2017/milestones?state=closed

### Future development and enhancements

I have developed 3 applications from the scratch for Ensembl Organization. Two back end applications and front end application.
I used Java as my main programming language , Spring Boot as application framework , Maven as the build tool , MySQL as primary database instance and Elastic Search for advaned indexing and searching of Tracks. For the front end, AngularJS , Gulp , Bootstrap and jQuery.

All these applications are developed according to industry standards. So anyone can develop and understand the projects. As future enhancements, it's good to add these.

1. Add more data into the application for better searching.
2. Make searching little bit faster analysing most used keywords and caching them.
3. Add more data visualizing features to front end.
4. Add termainl/command line operations features to back end applications.
5. Expand the REST API for more advanced searching and other locations like URL based data sources.
