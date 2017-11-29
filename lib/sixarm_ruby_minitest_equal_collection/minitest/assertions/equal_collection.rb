# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end

module MiniTest::Assertions
 
  ##
  # Succeeds when +exp+ and +act+ contain equal items and counts, regardless of order.

  def assert_equal_collection(expect, actual, msg = nil)
    shared_equal_collection(expect, actual, msg)
    diff = shared_diff(expect, actual)
    assert diff.empty?, 
      "Expected collections to have the same items. Expect: #{ expect.inspect }. Actual #{ actual.inspect }. Diff: #{ diff.inspect }." + append_msg(msg)
  end

  ##
  # Succeeds when +exp+ and +act+ contain different items and/or counts, regardless of order.

  def refute_equal_collection(expect, actual, msg = nil)
    shared_equal_collection(expect, actual)
    diff = shared_diff(expect, actual)
    refute diff.empty?,
      "Expected collections to not have the same items. Expect: #{ expect.inspect }. Actual: #{ actual.inspect }. Diff: #{ diff.inspect }" + append_msg(msg)
  end

  private

  def shared_equal_collection(expect, actual, msg = nil)
    refute_nil(expect, "Expected `expect`, but got nil." + append_msg(msg))
    refute_nil(actual, "Expected `actual`, but got nil." + append_msg(msg))
    assert_respond_to(expect, :each, "Expected `expect` to respond to each." + append_msg(msg))
    assert_respond_to(actual, :each, "Expected `actual` to respond to each." + append_msg(msg))
  end

  def append_msg(msg)
    msg ? " #{msg}" : ""
  end

  def countize(a)
    h = Hash.new(0)
    a.each{|x| h[x] += 1}
    h
  end

  def shared_diff(a, b)
    HashDiff.diff countize(a), countize(b)
  end

end
