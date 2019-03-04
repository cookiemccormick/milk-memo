# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
  Used Sinatra's application structure Milk Memo web application
- [x] Use ActiveRecord for storing information in a database
  Objects created in Milk Memo are stored in ActiveRecord.
- [x] Include more than one model class (e.g. User, Post, Category)
  Milk Memo has a total of 5 models - Baby, Appointment, Note, Medicine and User.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
  There are a total of 3 has_many relationships on the User model.  The User has_many appointments, notes and medications.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
  There are a total of 4 belongs_to relationships.  Baby, Appointment, Note and Medicine all belong_to the User.
- [x] Include user accounts with unique login attribute (username or email)
  A user must login with their username and password to be able to see their dashboard - create, read, update and delete their data.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
  Appointment, Note and Medicines all have routes for creating, reading, updated and destroying.  A baby is created upon signing up for the app, but once you are logged in, you may update, read and update the baby's data.
- [x] Ensure that users can't modify content created by other users
  Only the user, when logged in, is able to see their own data and be able to modify their content.  A user is not able to see other user's content.
- [x] Include user input validations
  Null false validations are placed on most of the Create Table migrations except for the baby name.  That attribute may be updated later, in case the user does not know that information at that time of signup.  Validations are also placed in all the
  models to make sure the attributes are present.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
  User receives a message confirming their actions of creating, editing or deleting an object.  User also receives a message if they login or signup incorrectly.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
  Yes, please see README.md.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message