# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app:
    - used corneal to scaffold, deleted unnecessary files, then build my project on top
- [x] Use ActiveRecord for storing information in a database
    - used AR and sql
- [x] Include more than one model class (e.g. User, Post, Category)
    - my app has a User and Tab model class
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
    - a User has_many Tabs
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
    - a Tab belongs_to a User
- [x] Include user accounts with unique login attribute (username or email)
    - each account must have a unique username. in `post '/signup'` i search for the username, if there is a match in the db, error message is shown and we redirect to sign up page for user to try again
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
    - it does
- [x] Ensure that users can't modify content created by other users
    - i use the helper method `logged_in?`, `current_user` to repeatedly confirm a user is logged into the session, the current user matches the session. Using helper methods keeps my code DRY. i use `current_user` here to validate that the tab instance actually belongs to the user  trying toaccess it  `@tab.user == current_user`
- [x] Include user input validations
    - i use the `required` keyword to make sure users fill out specified form fields before submitting  their data to the db. I set `type="email"` inside the `<input>` form field so that the user must format their text to be an email - aka using `@` and `.` 
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
    - i used the flash gem to display messages to the user if their input wasnt valid

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
