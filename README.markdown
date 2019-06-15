# Customer Inviter [![Build Status](https://travis-ci.org/tiarly/customer_inviter.svg?branch=feature)](https://travis-ci.org/tiarly/customer_inviter)

[![forthebadge](http://forthebadge.com/images/badges/made-with-ruby.svg)](http://forthebadge.com) [![forthebadge](http://forthebadge.com/images/badges/built-with-love.svg)](http://forthebadge.com)

This is an attempt to solve the given find the users within a given distance problem.

## Description

* This Lib will basically receive and input file as its first argument and attemp to load in a group of users and then will try to filter based on each user location with the one we have defined as the base.
* Since it wasn't requested for how the application should handle the response/output I ended up choosing via console.

## Usage

* You can use the console directly or the faser way by executing the actual ruby file and passing the input file as the first argument, as shown bellow:

```shell
$ ./bin/customer_inviter './samples/customers.txt'
```

## Setup

```shell
$ bundle install
```

## Running Specs

```shell
$ rake
```

## Running CI

```shell
$ rake ci
```

## Custom Dependencies

* This library depends on a custom gem called `https://github.com/tiarly/awesome_distance_calculator` built just for this, to make easier for projects to calculate distances between two given locations.
