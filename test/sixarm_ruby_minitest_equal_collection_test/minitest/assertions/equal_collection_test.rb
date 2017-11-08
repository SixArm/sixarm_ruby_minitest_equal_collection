# -*- coding: utf-8 -*-

describe "Minitest" do

  describe "Assertions" do

    describe "#assert_equal_collection" do

      describe "empty collections => pass" do

        describe "with array" do

          specify "both empty => pass" do
            assert_equal_collection([], [])
          end

          specify "only one empty => fail" do
            proc { 
              assert_equal_collection([], [:a])
            }.must_raise MiniTest::Assertion
          end

        end
      
        describe "with hash" do

          specify "with both empty => pass" do
            assert_equal_collection({}, {})
          end

          specify "with one empty => fail" do
            proc { 
              assert_equal_collection({}, {a: 1})
            }.must_raise MiniTest::Assertion
          end

        end

      end

      describe "equal collections => pass" do

        describe "with array" do

          specify "with equal => pass" do
            assert_equal_collection([:a], [:a])
          end

          specify "with unequal => fail" do
            proc {
              assert_equal_collection([:a], [:b])
            }.must_raise MiniTest::Assertion
          end

        end

        describe "with hash" do

          specify "with equal => pass" do
            assert_equal_collection({a: 1}, {a: 1})
          end

          specify "with unequal => fail" do
            proc {
              assert_equal_collection({a: 1}, {b: 1})
            }.must_raise MiniTest::Assertion
          end

        end

      end

      describe "count is relevant" do

        describe "with array" do

          specify "with equal count => pass" do
            assert_equal_collection([:a], [:a])
          end

          specify "with unequal count => fail" do
            proc { 
              assert_equal_collection([:a], [:a, :a])
            }.must_raise MiniTest::Assertion
          end

        end

        describe "with hash" do

          specify "with equal count => pass" do
              assert_equal_collection({a: 1}, {a: 1})
          end

          specify "with unequal count => fail" do
            proc { 
              assert_equal_collection({a: 1}, {a: 1, b: 1})
            }.must_raise MiniTest::Assertion
          end

        end

      end

      describe "order is irrelevant" do

        describe "with array" do

          specify "with same items and same order => pass" do
            assert_equal_collection([:a, :b], [:a, :b])
          end

          specify "with same items and different order => pass" do
            assert_equal_collection([:a, :b], [:b, :a])
          end

        end

        describe "with hash" do

          specify "with same order => pass" do
            assert_equal_collection({a: 1, b: 2}, {a: 1, b: 2})
          end

          specify "with different order => pass" do
            assert_equal_collection({a: 1, b: 2}, {b: 2, a: 1})
          end

        end

      end

    end


    describe "#refute_equal_collection" do

      describe "empty collections => fail" do

        describe "with array" do

          specify "both empty => fail" do
            proc {
              refute_equal_collection([], [])
            }.must_raise MiniTest::Assertion
          end

          specify "only one empty => pass" do
            refute_equal_collection([], [:a])
          end

        end

        describe "with hash" do

          specify "with both empty => fail" do
            proc { 
              refute_equal_collection({}, {})
            }.must_raise MiniTest::Assertion
          end

          specify "with one empty => pass" do
            refute_equal_collection({}, {a: 1})
          end

        end

      end

      describe "equal collections => fail" do

        describe "with array" do

          specify "with equal => fail" do
            proc {
              refute_equal_collection([:a], [:a])
            }.must_raise MiniTest::Assertion
          end

          specify "with unequal => succes" do
            refute_equal_collection([:a], [:b])
          end

        end

        describe "with hash" do

          specify "with equal => fail" do
            proc {
              refute_equal_collection({a: 1}, {a: 1})
            }.must_raise MiniTest::Assertion
          end

          specify "with unequal => pass" do
            refute_equal_collection({a: 1}, {b: 1})
          end

        end

      end

      describe "count is relevant" do

        describe "with array" do

          specify "with equal count => fail" do
            proc { 
              refute_equal_collection([:a], [:a])
            }.must_raise MiniTest::Assertion
          end

          specify "with unequal count => pass" do
            refute_equal_collection([:a], [:a, :a])
          end

        end

        describe "with hash" do

          specify "with equal count => fail" do
            proc { 
              refute_equal_collection({a: 1}, {a: 1})
            }.must_raise MiniTest::Assertion
          end

          specify "with unequal count => pass" do
            refute_equal_collection({a: 1}, {a: 1, b: 1})
          end

        end

      end

      describe "order is irrelevant" do

        describe "with array" do

          specify "with same items and same order => fail" do
            proc {
              refute_equal_collection([:a, :b], [:a, :b])
            }.must_raise MiniTest::Assertion
          end

          specify "with same items but different order => fail" do
            proc {
              refute_equal_collection([:a, :b], [:b, :a])
            }.must_raise MiniTest::Assertion
          end

        end

        describe "with hash" do

          specify "with same items and same order => fail" do
            proc {
              refute_equal_collection({a: 1, b: 2}, {a: 1, b: 2})
            }.must_raise MiniTest::Assertion
          end

          specify "with same items and different order => fail" do
            proc {
              refute_equal_collection({a: 1, b: 2}, {b: 2, a: 1})
            }.must_raise MiniTest::Assertion
          end

        end

      end

    end

  end 

end
