# devops

This project provides a set of tools for deploying a Nitrogen service using [Deis](http://deis.io).

## Getting Started

If you haven't used Deis before, quickly jump over to [the documentation](http://docs.deis.io/en/latest/) and get to a high level understanding before moving on.

A service environment is defined via a set of JSON description files. This project includes templates for a staging environment and a small production environment in enviroments/staging and environments/production. You can use these as templates for building out your own environments. Simply copy the whole directory and then modify the config.json files with the configuration for your environment.

## Installing Nitrogen

Once you have your configuration specified, build the creation and installation scripts with (using the staging environment as an example):

`./build staging`

From the environments/staging directory, the next step is to create the cluster:

`./create-cluster.sh`

This will spin up a CoreOS cluster and then install and start Deis on it over the course of about a half hour.

Finally, we need to install the four Nitrogen services: the frontdoor, ingestion, registry and consumption services. You can do that with:

`./install.sh`

This will check out the current version of each of these services from github into the staging environment directory, configure your Deis service with their configuration details, and

Once these are installed, you can subsequently upgrade them by pulling the latest version from github and then pushing that to the Deis cluster:

1. `git pull origin master`
2. `git push deis master`

## Nitrogen Project

The Nitrogen project is housed in a set of GitHub projects:

1. [service](https://github.com/nitrogenjs/service): Core platform responsible for managing principals, security, and messaging.
2. [client](https://github.com/nitrogenjs/client): JavaScript client library for building Nitrogen devices and applications.
3. [admin](https://github.com/nitrogenjs/admin): Web admin tool for working with the Nitrogen service.
4. [device](https://github.com/nitrogenjs/devices): Device principals for common pieces of hardware.
5. [commands](https://github.com/nitrogenjs/commands): CommandManagers and schemas for well known command types.
6. [cli](https://github.com/nitrogenjs/cli): Command line interface for working with the Nitrogen service.
7. [reactor](https://github.com/nitrogenjs/reactor): Always-on hosted application execution platform.
8. [apps](https://github.com/nitrogenjs/apps): Project maintained Nitrogen applications.