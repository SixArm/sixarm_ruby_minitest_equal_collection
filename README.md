<img src="README.png" width="960" height="120" alt="README" />

# SixArm.com → Ruby → minitest<br> equal_collection assert & expect


<!--HEADER-OPEN-->

[![Gem Version](https://badge.fury.io/rb/sixarm_ruby_minitest_equal_collection.svg)](http://badge.fury.io/rb/sixarm_ruby_minitest_equal_collection)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_minitest_equal_collection.png)](https://travis-ci.org/SixArm/sixarm_ruby_minitest_equal_collection)
[![Code Climate](https://codeclimate.com/github/SixArm/sixarm_ruby_minitest_equal_collection.png)](https://codeclimate.com/github/SixArm/sixarm_ruby_minitest_equal_collection)
[![Coverage Status](https://coveralls.io/repos/SixArm/sixarm_ruby_minitest_equal_collection/badge.svg?branch=master&service=github)](https://coveralls.io/github/SixArm/sixarm_ruby_minitest_equal_collection?branch=master)

* Git: <https://github.com/sixarm/sixarm_ruby_minitest_equal_collection>
* Doc: <http://sixarm.com/sixarm_ruby_minitest_equal_collection/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_minitest_equal_collection>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Project: [Changes](CHANGES.md), [License](LICENSE.md), [Contributing](CONTRIBUTING.md).

<!--HEADER-SHUT-->

## Introduction

Minitest extensions for our common cases:

Assert:

   * assert_true
   * assert_false
   * assert_respond_to_all
   * assert_equal_items

Spec:

   * must_be_true
   * must_be_false
   * must_respond_to_all
   * must_have_equal_items

Based on Minitest.

For docs go to <http://sixarm.com/sixarm_ruby_minitest_equal_collection/doc>

Want to help? We're happy to get pull requests.


<!--INSTALL-OPEN-->

## Install

### Gem

Run this command in your shell or terminal:

    gem install sixarm_ruby_minitest_equal_collection

Or add this to your Gemfile:

    gem 'sixarm_ruby_minitest_equal_collection'

### Require

To require the gem in your code:

    require 'sixarm_ruby_minitest_equal_collection'

<!--INSTALL-SHUT-->


## Examples

Example Minitest spec:

    describe Foo do
      it "validates" do
        f = Foo.new
        f.valid?.must_be_true
      end
    end

Example Minitest spec:

    describe Foo do
      it "is colorful" do
        f = Foo.new
        f.must_respond_to_all [:red, :green, :blue]
      end
    end
