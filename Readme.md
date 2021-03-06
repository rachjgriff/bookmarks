# README: BOOKMARK MANAGER
----------
* Makers Academy Wk 4 Weekly Challenge
* https://github.com/makersacademy/course/blob/master/bookmark_manager/00_challenge_map.md
* The commits on master branch roughly correspond with the walkthroughs provided in the challenge

## BRIEF
----------
* Build a web app that stores web bookmarks in a database

## KEY FOCUS
----------
* Agile and TDD
* Engineering and 'Dev Recipes'
* Databases
* Tooling

## APP
---------
#### SET UP INSTRUCTIONS
---------
```
rackup
```
URL: http://localhost:9292/bookmarks

## TESTING
--------
```
rspec
```

## DATABASE: bookmark_manager
---------
### SET UP INSTRUCTIONS
---------
* Connect to psql
* Create the database and the testing database using the psql commands:

```
CREATE DATABASE bookmark_manager;
CREATE DATABASE bookmark_manager_test;
```

* Connect to the database using the pqsl command:

```
 \c bookmark_manager;
 \c bookmark_manager_test;
 ```

* To set up the appropriate tables, connect to each database in 'psql' and run the SQL scripts in the 'db/migration' folder in the given order.

## WEBSITE SPECIFICATION (REQUIREMENTS)
----------
* Show a list of bookmarks
* Add new bookmarks
* Delete bookmarks
* Update bookmarks
* Comment on bookmarks
* Tag bookmarks into categories
* Filter bookmarks by tag
* Users are restricted to manage only their own bookmarks

## USER STORIES
---------
#### USER STORY 1: List of bookmarks
---------
As a URL Hoarder  
So that I can see all the URLs I hoard in an organised way  
I’d like to see a list of bookmarks

Domain Model: https://github.com/makersacademy/course/blob/master/bookmark_manager/images/bookmark_manager_1.png

Requirements: Controller, Bookmark class, bookmark view

MVC Model:

| Component   | Responsibility                                | Refactor                                |
|------------ |---------------------------------------------  |---------------------------------------- |
| Model       | Encapsulate logic with relevant data          | Encapsulate bookmark data in a class    |
| View        | Display the result to a user                  | Show the bookmark data in a list        |
| Controller  | Get data from the model and put in the view   | Render bookmark data into to the view   |

#### USER STORY 2: Add new bookmarks
---------
As a time-pressed user  
So that I can save a website  
I would like to add the site's address and title to bookmark manager
#### USER STORY 3: Delete bookmarks
---------
As a user
So I can remove my bookmark from Bookmark Manager
I want to delete a bookmark
