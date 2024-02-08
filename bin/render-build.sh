#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
rails assets:precompile
rails assets:clean
rails db:drop db:create db:migrate db:seed