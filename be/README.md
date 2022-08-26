# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* How to add / remove gem
init Gemfile & bundle install in container
```
$ rm Gemfile.lock
$ touch Gemfile.lock
$ docker-compose run <service_name> bundle install
```
build
```
$ docker-compose build <service_name>
```
