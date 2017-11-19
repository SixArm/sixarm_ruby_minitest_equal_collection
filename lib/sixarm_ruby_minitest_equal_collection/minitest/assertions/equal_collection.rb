# -*- coding: utf-8 -*-
=begin rdoc
Please see README
=end

module MiniTest::Assertions
 
  ##
  # Succeeds when +exp+ and +act+ contain equal items and counts, regardless of order.

  def assert_equal_collection(expect, actual)
    refute_nil expect, "Expected a collection, but got nil"
    assert_respond_to expect, :each, "Expected a collection that can respond to each"
    diff = diff(expect, actual)
    assert diff.empty?, 
      "Expected #{ expect.inspect } and #{ actual.inspect } to have the same items. Diff: #{ diff.inspect }"
  end

  ##
  # Succeeds when +exp+ and +act+ contain different items and/or counts, regardless of order.

  def refute_equal_collection(expect, actual)
    refute_nil expect, "Expected a collection, but got nil"
    assert_respond_to expect, :each, "Expected a collection that canx respond to each"
    diff = diff(expect, actual)
    refute diff.empty?,
      "Expected #{ expect.inspect } and #{ actual.inspect } to not have the same items. Diff: #{ diff.inspect }"
  end

  private

  def countize(a)
    h = Hash.new(0)
    a.each{|x| h[x] += 1}
    h
  end

  def diff(a, b)
    HashDiff.diff countize(a), countize(b)
  end

end
