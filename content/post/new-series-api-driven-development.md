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

## Use Case

In this series I'd like to propose a use case, which we'll use as a reference point.
As a side project I'm working on tool called [Bonsai](https://github.com/mauvm/bonsai).
A web based task and idea manager that focuses on privacy.
The concept is a web interface that does local offline storage, but optionally synchronizes to a cloud server.
However I'd like to use my own server to store persist the tasks and ideas I write down.
So in case my computer crashes, I wont lose all my entries.
To accomplish this I've designed the following schematic:

```
Users -1:M-> Items
Items -1:M-> Aggregates
Items -1:M-> Tags
```

After registering a user, you can add items (tasks, ideas, notes, etc.) which will be ran through the added aggregates.
Aggregates are JavaScript function bodies that run in a virtual machine (VM) and do the following:

- Manipulate the item data
- Create a new item
- Add tags to the new item (metadata)
- Optionally archive the old item

An example:

```
POST /aggregates
// On separate lines instead of `\n` for readability.
// We have underscore (`_`), `item`, and `newItem` (copy of item) available.
// Return false to cancel insertion.
{ "fn": "
	if ( ! _.contains(item.text, "test")) return false
	newItem.addTag({ "label": "testing" })
" }

POST /items
{ "title": "Hello world!", "text": "This is a test message." }
// The "_archived = true" attribute will be added to this item
// and another item will be added with the tag "testing".
```

At a later stage we have the option to add a real time aspect: providing the aggregated data.

## Next Up

In the next post we'll discuss existing philosophies and configuration driven APIs. Two very interesting topics: what can we learn from others and does the silver bullet exist? [Click here](post/add-1-philosophies-and-configuration-driven-apis) to read it.
