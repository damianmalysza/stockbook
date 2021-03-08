# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app -- Sinatra used to build the app
- [x] Use ActiveRecord for storing information in a database -- ActiveRecord was used for storing information in a DB
- [x] Include more than one model class (e.g. User, Post, Category) -- 3 models included in project
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) -- A user has many watchlists
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) -- A watchlist belongs to a user
- [x] Include user accounts with unique login attribute (username or email) -- A unique username is used as login attribute
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying -- A watchlist has routes for CRUD
- [x] Ensure that users can't modify content created by other users -- User can only modify content that belongs to them
- [x] Include user input validations -- Validation is used on all user entered data
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) -- Validation failures are displayed via flash messages
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - Readme contains short description, install instructions, contributors guide and link to license

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message