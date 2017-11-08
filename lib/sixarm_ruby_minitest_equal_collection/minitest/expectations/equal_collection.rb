# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end

module Minitest::Expectations
  Enumerable.infect_an_assertion :assert_equal_collection, :must_equal_collection
  Enumerable.infect_an_assertion :refute_equal_collection, :wont_equal_collection
end
