# -*- coding: utf-8 -*-
require "sixarm_ruby_minitest_equal_collection"

describe "Minitest" do

  describe "Expectations" do

    describe "#must_equal_collection" do

      describe "empty collections => pass" do

        describe "with array" do

          specify "both empty => pass" do
            expect([]).must_equal_collection []
          end

          specify "only one empty => fail" do
            proc { 
              expect([]).must_equal_collection [:a]
            }.must_raise MiniTest::Assertion
          end

        end
      
        describe "with hash" do

          specify "with both empty => pass" do
            expect({}).must_equal_collection({})
          end

          specify "with one empty => fail" do
            proc { 
              expect({}).must_equal_collection({a: 1})
            }.must_raise MiniTest::Assertion
          end

        end

      end

      describe "equal collections => pass" do

        describe "with array" do

          specify "with equal => pass" do
            expect([:a]).must_equal_collection [:a]
          end

          specify "with unequal => fail" do
            proc {
              expect([:a]).must_equal_collection [:b]
            }.must_raise MiniTest::Assertion
          end

        end

        describe "with hash" do

          specify "with equal => pass" do
            expect({a: 1}).must_equal_collection({a: 1})
          end

          specify "with unequal => fail" do
            proc {
              expect({a: 1}).must_equal_collection({b: 1})
            }.must_raise MiniTest::Assertion
          end

        end

      end

      describe "count is relevant" do

        describe "with array" do

          specify "with equal count => pass" do
            expect([:a]).must_equal_collection [:a]
          end

          specify "with unequal count => fail" do
            proc { 
              expect([:a]).must_equal_collection [:a, :a]
            }.must_raise MiniTest::Assertion
          end

        end

        describe "with hash" do

          specify "with equal count => pass" do
            expect({a: 1}).must_equal_collection({a: 1})
          end

          specify "with unequal count => fail" do
            proc { 
              expect({a: 1}).must_equal_collection({a: 1, b: 1})
            }.must_raise MiniTest::Assertion
          end

        end

      end

      describe "order is irrelevant" do

        describe "with array" do

          specify "with same items and same order => pass" do
            expect([:a, :b]).must_equal_collection [:a, :b]
          end

          specify "with same items and different order => pass" do
            expect([:a, :b]).must_equal_collection [:b, :a]
          end

        end

        describe "with hash" do

          specify "with same order => pass" do
            expect({a: 1, b: 2}).must_equal_collection({a: 1, b: 2})
          end

          specify "with different order => pass" do
            expect({a: 1, b: 2}).must_equal_collection({b: 2, a: 1})
          end

        end

      end

      describe "with degenerate cases" do

        describe "with `actual` nil" do

          specify "raise" do
            err = proc {
              expect(nil).must_equal_collection []
            }.must_raise MiniTest::Assertion
            err.message.must_match(/\bactual\b.*\bnil\b/)
          end

        end

        describe "with `expect` nil" do

          specify "raise" do
            err = proc {
              expect([]).must_equal_collection nil
            }.must_raise MiniTest::Assertion
            err.message.must_match(/\bexpect\b.*\bnil\b/)
          end

        end

        describe "with `actual` that does not respond to each" do

          specify "raise" do
            err = proc {
              expect(Object.new).must_equal_collection []
            }.must_raise MiniTest::Assertion
            err.message.must_match(/\bactual\b.*\brespond to each\b/)
          end

        end

        describe "with `expect` that does not respond to each" do

          specify "raise" do
            err = proc {
              expect([]).must_equal_collection Object.new
            }.must_raise MiniTest::Assertion
            err.message.must_match(/\bexpect\b.*\brespond to each\b/)
          end

        end

      end

    end

    describe "#wont_equal_collection" do

      describe "empty collections => fail" do

        describe "with array" do

          specify "both empty => fail" do
            proc {
              expect([]).wont_equal_collection []
            }.must_raise MiniTest::Assertion
          end

          specify "only one empty => pass" do
            expect([]).wont_equal_collection [:a]
          end

        end

        describe "with hash" do

          specify "with both empty => fail" do
            proc { 
              expect({}).wont_equal_collection({})
            }.must_raise MiniTest::Assertion
          end

          specify "with one empty => pass" do
            expect({}).wont_equal_collection({a: 1})
          end

        end

      end

      describe "equal collections => fail" do

        describe "with array" do

          specify "with equal => fail" do
            proc {
              expect([:a]).wont_equal_collection [:a]
            }.must_raise MiniTest::Assertion
          end

          specify "with unequal => succes" do
            expect([:a]).wont_equal_collection [:b]
          end

        end

        describe "with hash" do

          specify "with equal => fail" do
            proc {
              expect({a: 1}).wont_equal_collection({a: 1})
            }.must_raise MiniTest::Assertion
          end

          specify "with unequal => pass" do
            expect({a: 1}).wont_equal_collection({b: 1})
          end

        end

      end

      describe "count is relevant" do

        describe "with array" do

          specify "with equal count => fail" do
            proc { 
              expect([:a]).wont_equal_collection [:a]
            }.must_raise MiniTest::Assertion
          end

          specify "with unequal count => pass" do
            expect([:a]).wont_equal_collection [:a, :a]
          end

        end

        describe "with hash" do

          specify "with equal count => fail" do
            proc { 
              expect({a: 1}).wont_equal_collection({a: 1})
            }.must_raise MiniTest::Assertion
          end

          specify "with unequal count => pass" do
            expect({a: 1}).wont_equal_collection({a: 1, b: 1})
          end

        end

      end

      describe "order is irrelevant" do

        describe "with array" do

          specify "with same items and same order => fail" do
            proc {
              expect([:a, :b]).wont_equal_collection [:a, :b]
            }.must_raise MiniTest::Assertion
          end

          specify "with same items but different order => fail" do
            proc {
              expect([:a, :b]).wont_equal_collection [:b, :a]
            }.must_raise MiniTest::Assertion
          end

        end

        describe "with hash" do

          specify "with same items and same order => fail" do
            proc {
              expect({a: 1, b: 2}).wont_equal_collection({a: 1, b: 2})
            }.must_raise MiniTest::Assertion
          end

          specify "with same items and different order => fail" do
            proc {
              expect({a: 1, b: 2}).wont_equal_collection({b: 2, a: 1})
            }.must_raise MiniTest::Assertion
          end

        end

      end

      describe "with degenerate cases" do

        describe "with `actual` nil" do

          specify "raise" do
            err = proc {
              expect(nil).wont_equal_collection []
            }.must_raise MiniTest::Assertion
            err.message.must_match(/\bactual\b.*\bnil\b/)
          end

        end

        describe "with `expect` nil" do

          specify "raise" do
            err = proc {
              expect([]).wont_equal_collection nil
            }.must_raise MiniTest::Assertion
            err.message.must_match(/\bexpect\b.*\bnil\b/)
          end

        end

        describe "with `actual` that does not respond to each" do

          specify "raise" do
            err = proc {
              expect(Object.new).wont_equal_collection []
            }.must_raise MiniTest::Assertion
            err.message.must_match(/\bactual\b.*\brespond to each\b/)
          end

        end

        describe "with `expect` that does not respond to each" do

          specify "raise" do
            err = proc {
              expect([]).wont_equal_collection Object.new
            }.must_raise MiniTest::Assertion
            err.message.must_match(/\bexpect\b.*\brespond to each\b/)
          end

        end

      end

    end

  end 

end
