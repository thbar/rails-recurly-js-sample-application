This is a work-in-progress of a sample Rails app supporting recurring payments with Recurly.js.

[![Build Status](https://travis-ci.org/thbar/rails-recurly-js-sample-application.png)](https://travis-ci.org/thbar/rails-recurly-js-sample-application) [![Code Climate](https://codeclimate.com/github/thbar/rails-recurly-js-sample-application.png)](https://codeclimate.com/github/thbar/rails-recurly-js-sample-application)

## Preliminary reading

* [Recurly.js: The Basics](https://www.wisecashhq.com/blog/recurly-js-the-basics)
* [Recurly.js: Picking a Signup Workflow](https://www.wisecashhq.com/blog/recurly-js-signup-workflow)
* Recurly.js: Implementing Sign-Up (currently being written)

## Setup

* create a [Recurly account](http://recurly.com) (free as long as you do not enable a production payment gateway)
* create a "freelancer" plan
* you'll want to setup VAT etc if applicable in your settings
* enable API access and JS API access
* create `config/settings.yml` based on the sample
* `bundle install`
* `rake db:schema:load`
* `bin/rails s`


