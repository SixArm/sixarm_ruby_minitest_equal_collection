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

Minitest extension that compares two collections, such as two arrays, or two hashes, or two enumerable objects.

  * If the two collections have equal items, independent of order, then the test passes. 

  * Example: `[1, 2, 3]` and `[3, 2, 1]` passes because the comparision is independent of order.

  * Example: `[1, 2, 2]` and `[1, 1, 2]` fails because the collections have different item counts.

Assert:

   * assert_equal_collection(a, b)

   * refute_equal_collection(a, b)

Spec:

   * expect(a).must_equal_collection(b)

   * expect(a).wont_equal_collection(b)

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

Example minitest:

    def test_order_independent
      a = [1, 2, 3]
      b = [3, 2, 1]
      assert_equal_collection(a, b)
    end

Example minitest spec:

    it "is order independent" do
      a = [1, 2, 3]
      b = [3, 2, 1]
      expect(a).must_equal_collection(b)
    end
