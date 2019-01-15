#!/bin/sh

# A Ruby static code analyzer and formatter,
# based on the community Ruby style guide.
bundle exec rubocop --auto-correct

# Patch-level verification for Bundler
# update vulnerable gem with:
#   `bundle update --patch --conservative <vulnerable-gem-name>`
bundle audit check --update

# A static analysis security vulnerability
# scanner for Ruby on Rails applications
bundle exec brakeman

bundle exec fasterer

bundle exec rails test
