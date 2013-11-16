This is a work-in-progress of a sample Rails app supporting recurring payments with Recurly.js.

Follow me on Twitter for updates: [@thibaut_barrere](http://twitter.com/thibaut_barrere)

## Preliminary reading

* [Recurly.js: The Basics](https://www.wisecashhq.com/blog/recurly-js-the-basics)
* [Recurly.js: Picking a Signup Workflow](https://www.wisecashhq.com/blog/recurly-js-signup-workflow)
* Recurly.js: Implementing Sign-Up (currently being written)

## Code status

The code is not meant to be high-quality, nice looking etc but rather, a quick getting started guide with minimal dependencies and scenarios.

[![Build Status](https://travis-ci.org/thbar/rails-recurly-js-sample-application.png)](https://travis-ci.org/thbar/rails-recurly-js-sample-application) [![Code Climate](https://codeclimate.com/github/thbar/rails-recurly-js-sample-application.png)](https://codeclimate.com/github/thbar/rails-recurly-js-sample-application)

- [x] As a user, I can sign-up for a monthly subscription of your great product
- [x] As a user, I can also close my account which will result in immediate termination
- [ ] As a user, I want to be able to update my billing information
- [ ] As a user, I want to list my past invoices

## Setup

* create a [Recurly account](http://recurly.com) (free as long as you do not enable a production payment gateway)
* create a "freelancer" plan
* you'll want to setup VAT etc if applicable in your settings
* enable API access and JS API access
* create `config/settings.yml` based on the sample
* `bundle install`
* `rake db:schema:load`
* `bin/rails s`


