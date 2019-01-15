# Lifen backend app

> Implementation of Level 5 of the Lifen test

This level is a little bit different: we are now looking for a live application that helps us manage workers and shift.

We are expecting a link to a hosted application that enable us to:
- add and edit workers
- add and assign shifts
- consult shifts

The application should be as simple as possible (for example, authentication is not expected).

# Getting started

To get the Rails server running locally:

- Clone this repo
- `bundle install` to install all req'd dependencies
- `rake db:migrate` to make all database migrations
- `rake db:seed` to populate database with datas
- `rails s` to start the local server


# Code Overview

## Dependencies

- [trestle](https://github.com/TrestleAdmin/trestle) - A modern, responsive admin framework for Ruby on Rails

## Folders

- `app/models` - Contains the database models for the application where we can define methods, validations, queries, and relations to other models.
- `app/views` - Contains templates for generating the JSON output for the API
- `app/controllers` - Contains the controllers where requests are routed to their actions, where we find and manipulate our models and return them for the views to render.
- `config` - Contains configuration files for our Rails application and for our database, along with an `initializers` folder for scripts that get run on boot.
- `db` - Contains the migrations needed to create our database schema.
