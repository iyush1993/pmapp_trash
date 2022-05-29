# README

### Steps to get it running:
- Clone the repository
- Set 'MYSQL_ROOT_PASSWORD' as your environment variable
- Install Gems: `bundle install`
- Run migration: `rails db:migrate`
- Start server: `rails s`

### Gems used:

1) Bcrypt - to use ActiveModel's has_secure_password / to store password securely
2) Rack Cors - to enable cross domain requests
3) JWT - to use JWT mechanism to authenticate users
4) Fast jsonapi - to serialize json data with only necessary attributes
5) Shoulda matchers - to import helpful rails matchers for validations and associations
6) Rspec - to use as a test framework


### References:
https://dev.to/alexmercedcoder/ruby-on-rails-api-with-jwt-auth-tutorial-go2
