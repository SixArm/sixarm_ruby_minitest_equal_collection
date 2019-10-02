# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end

unless defined?(Minitest) then
  # Minitest 5 and MiniTest 4 use different capitalizations.
  module Minitest; end
  MiniTest = Minitest # prevents minitest.rb from requiring back to us
  require "minitest"
end

MiniTest = Minitest unless defined?(MiniTest)

require 'Hashdiff'

require 'sixarm_ruby_minitest_equal_collection/minitest/assertions/equal_collection'
require 'sixarm_ruby_minitest_equal_collection/minitest/expectations/equal_collection'
