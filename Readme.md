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
