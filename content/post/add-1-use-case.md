+++
date = "2016-07-15T14:10:35Z"
description = ""
author = "Maurits"
title = "ADD 1: Use Case"
+++

In this series I'd like to propose a use case, which we'll use as a reference point.
As a side project I'm working on tool called [Bonsai](https://github.com/mauvm/bonsai).
A web based task and idea manager that focuses on privacy.
The concept is a web interface that does local offline storage, but optionally synchronizes to a cloud server.
However I'd like to use my own server to store persist the tasks and ideas I write down.
So in case my computer crashes, I wont lose all my entries.
To accomplish this I've designed the following schematic:

```
Users
	id (number)
	name (string)
	email (string)
	password (string)
	token (string)
	is_active (bool)
	is_admin (bool)
	created_at (datetime)
	updated_at (datetime)

Items
	id (number)
	data (JSON object)
	_archived (bool)
	_new_id (number)
	created_at (datetime)
	updated_at (datetime)

Aggregates
	id (number)
	fn (string)
	created_at (datetime)
	updated_at (datetime)

Tags
	id (number)
	item_id (number)
	data (JSON object)
	created_at (datetime)
	updated_at (datetime)

Users -1:M-> Items
Items -1:M-> Aggregates
Items -1:M-> Tags
```

After registering a user, you can add items (tasks, ideas, notes, etc.) which will be ran through the added aggregates.
Aggregates are (JavaScript?) function bodies that run in a virtual machine (VM) and do the following:

- Manipulate the item data
- Create a new item
- Add tags to the new item (metadata)
- Optionally archive the old item

This example should clarify:

```json
// Adding the "testing" tag to a item which contains the text "test".

// HTTP POST /aggregates
// On separate lines instead of `\n` for readability.
// We have underscore (`_`), `item`, and `newItem` (copy of item) available.
// Return false to cancel insertion of the newItem.
{ "fn": "
	if ( ! _.contains(item.text, 'test')) return false
	newItem.addTag({ 'label': 'testing' })
" }

// HTTP POST /items
{ "title": "Hello world!", "text": "This is a test message." }
// The "_archived = true" attribute will be added to this item,
// the newItem.id will be added under "_new_id" (to build a timeline),
// and another item will be added with the tag "testing".
```

Note that this is a first draft. It will most likely change. I've only added the JSON snippets to clarify my goal: a configuration driven task manager. For now the design is basic. Later on we'll deal with the order aggregates are processed, extending the tooling (not only using underscore for example), etc. Also at a later stage we have the option to add a real time aspect: providing the aggregated data.

## Next Up

In the next post we'll discuss existing philosophies and configuration driven APIs. Two very interesting topics: what can we learn from others and does the silver bullet exist?

<!--[Click here](/post/add-2-philosophies-and-configuration-driven-apis/) to read it.-->
