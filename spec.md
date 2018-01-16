# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
  * _ActiveRecord installed in Gemfile, all models and migrations inherit from ActiveRecord._
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
  * _User, Workout, and Exercise models._
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
  * _User has_many workouts, User has_many exercises, Workout has_many exercises._
- [x] Include user accounts
  * _User can sign up with username, email, and password. User can log in and log out._
- [x] Ensure that users can't modify content created by other users
  * _User can only modify their own content, accessed by `session[user_id]`._
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
  * _Exercises and workouts can be created, viewed, edited, and deleted._
- [x] Include user input validations
  * _User must have unique username and email._
  * _User must have password to create account._
  * _Exercises must have names to be created._
  * _Workouts must have date to be created._
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
 * _Flash is used to notify user of input fields that must be filled._
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
