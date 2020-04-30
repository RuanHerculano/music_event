# Event music 

## Requirements

    docker
    docker-compose

## Setting up

The project has a setup scripts, so for setting everything up, just run the following command on the project root

    ./setup.sh

This script will do the following actions:

1- Creates the etc/hosts entry 

2- Build the docker images used on the project

With the docker running, it`s time to run the migrations

    docker exec -it api.music.event rails db:migrate

## Structure

This project has the following sub directories:

- apps
    
    In here we have all the actual code for the program.

-  config

    In here you'll find all the env variables used for the project, each one in a specifc .env fil

- services

    The NgInx configuration files to run the code without using localhost.

## Using the system

Once the software is up and running just head to [http://client.music.event](http://client.music.event), and creates an user and login.

## Running tests

For running the tests of this project first whe must make sure our test database is created, so run:

    docker exec -it api.music.event rails db:setup

This is going to create the test database, as defined in the .env files. Now it is time to run the actual tests:

    docker exec -it api.music.event rspec


## Known issues

sometimes the project won't startup after running the setup script, to fix that, simply run the following command on the root of the project

    docker-compose up