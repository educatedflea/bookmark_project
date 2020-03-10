# bookmark_project
This project is to build a bookmark manager according to following user stories.

# User stories
1.
As a time-pressed user
So that I can quickly go to websites I regularly visit
I would like to see a list of bookmarks
2.
As a time-pressed user
So that I can revisit a website I like
I would like to add a website of bookmarks
3.
As a time-pressed user
So that I can remove the website I no longer like
I would like to see a list of bookmarks, then delete it
4.
As a time-pressed user
So that I can see if my list is up to date
I would like to see a list of bookmarks after I add or delete
5.
As a time-pressed user
So that I can find a bookmark quicker
I would like to comment on bookmarks 
6.
As a time-pressed user
So that I can group my bookmarks 
I would like to tag bookmarks into categories
7.
As a time-pressed user
So that I can see see my bookmarks categories 
I would like to filter bookmarks by tags 
8.
As a time-pressed user
So that I can manage only my bookmarks
I would like to log in and manage 

# Domain model 
(./public/images/mermaid-diagram-20200309145612.png)

# To set up the database

Connect to `psql` and create the `bookmark_manager` database:

```
CREATE DATABASE bookmark_manager;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.