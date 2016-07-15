+++
date = "2016-07-15T08:16:35Z"
description = ""
author = "Maurits"
title = "New Series: API Driven Development"
+++

Modern systems are shifting towards service-oriented architectures (SOA). Mostly in the form of microservices. By splitting up the system into multiple components with their own code bases. This makes the system language agnostic. Meaning a development team is no longer restricted to using a few programminging languages. It allows software engineers to pick the right programming language for the service they need to develop. Every language has it's own aspects: Java is very maintainable, but does not always deliver optimal performance (since it's running in a virtual machine). Golang - for example - is less maintainble, but very robust and performant. And since the services are usually small, rewriting it in a more modern or suitable language becomes less work and has less impact on the system as a whole.

These multiple microservices need a way to communicate with each other. This is where Application Programmable Interfaces (APIs) come into play. These facades provide a __structured__ way to interact with a microservice. The word 'structured' is emphasized because if it's easy to predict how an API works, the effort for developers to link their microservices will be reduced significantly. Often [HTTP RESTful APIs](https://en.wikipedia.org/wiki/Representational_state_transfer) are used. HTTP is a widely used communication protocol. REpresentational State Transfer (REST) is an architectural style built on top of HTTP, fully utilizing HTTP status codes and providing a way to create uniform interfaces.

[API Driven Development (ADD)](http://apigee.com/about/blog/technology/api-centric-architecture-all-development-api-development) is becoming more prominent in developing microservices: if the API is the only way of retrieving, creating, and modifying resources on the server, the end user no longer cares how the data is being stored.
This development process focuses on creating the API specification first and then thinking about the storage method and other underlying parts of the microservice.

## Approach

In this blog post series we'll take a pragmatic approach into discovering the aspects of APIs and developing an general purpose API. Among others, these are the aspects we will dive into:

- Use case
- Existing philosophies, for example:
	- Swagger
	- JSONAPI
	- HAL
- Configuration driven APIs
- Authentication
- Defining resources
- Defining relations
- Manipulating responses
	- Pagination
	- Filtering
	- Ordering
	- Including relations
- Performance (e.g. throttling)
- Framework and programming language, for example:
	- Lumen (PHP)
	- Express (NodeJS)
	- Martini (Golang)

## Next Up

In the next post I'll propose a concept use case. It will be used and refined throughout the series. [Click here](/post/add-1-use-case/) to read it.
