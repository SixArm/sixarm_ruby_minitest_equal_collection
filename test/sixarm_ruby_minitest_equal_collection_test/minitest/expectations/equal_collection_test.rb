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
            expect { 
              expect([]).must_equal_collection [:a]
            }.must_raise MiniTest::Assertion
          end

        end
      
        describe "with hash" do

          specify "with both empty => pass" do
            expect({}).must_equal_collection({})
          end

          specify "with one empty => fail" do
            expect { 
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
            expect {
              expect([:a]).must_equal_collection [:b]
            }.must_raise MiniTest::Assertion
          end

        end

        describe "with hash" do

          specify "with equal => pass" do
            expect({a: 1}).must_equal_collection({a: 1})
          end

          specify "with unequal => fail" do
            expect {
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
            expect { 
              expect([:a]).must_equal_collection [:a, :a]
            }.must_raise MiniTest::Assertion
          end

        end

        describe "with hash" do

          specify "with equal count => pass" do
            expect({a: 1}).must_equal_collection({a: 1})
          end

          specify "with unequal count => fail" do
            expect { 
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
            expect {
              expect(nil).must_equal_collection []
            }.must_raise MiniTest::Assertion
            begin
              expect(nil).must_equal_collection []
            rescue MiniTest::Assertion => err
              expect(err.message).must_match(/\bactual\b.*\bnil\b/)
            end
          end

        end

        describe "with `expect` nil" do

          specify "raise" do
            expect {
              expect([]).must_equal_collection nil
            }.must_raise MiniTest::Assertion
            begin
              expect([]).must_equal_collection nil
            rescue MiniTest::Assertion => err
              expect(err.message).must_match(/\bexpect\b.*\bnil\b/)
            end
          end

        end

        describe "with `actual` that does not respond to each" do

          specify "raise" do
            expect {
              expect(Object.new).must_equal_collection []
            }.must_raise MiniTest::Assertion
            begin
              expect(Object.new).must_equal_collection []
            rescue MiniTest::Assertion => err
              expect(err.message).must_match(/\bactual\b.*\brespond to each\b/)
            end
          end

        end

        describe "with `expect` that does not respond to each" do

          specify "raise" do
            expect {
              expect([]).must_equal_collection Object.new
            }.must_raise MiniTest::Assertion
            begin
              expect([]).must_equal_collection Object.new
            rescue MiniTest::Assertion => err
              expect(err.message).must_match(/\bexpect\b.*\brespond to each\b/)
            end
          end

        end

      end

    end

    describe "#wont_equal_collection" do

      describe "empty collections => fail" do

        describe "with array" do

          specify "both empty => fail" do
            expect {
              expect([]).wont_equal_collection []
            }.must_raise MiniTest::Assertion
          end

          specify "only one empty => pass" do
            expect([]).wont_equal_collection [:a]
          end

        end

        describe "with hash" do

          specify "with both empty => fail" do
            expect { 
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
            expect {
              expect([:a]).wont_equal_collection [:a]
            }.must_raise MiniTest::Assertion
          end

          specify "with unequal => succes" do
            expect([:a]).wont_equal_collection [:b]
          end

        end

        describe "with hash" do

          specify "with equal => fail" do
            expect {
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
            expect { 
              expect([:a]).wont_equal_collection [:a]
            }.must_raise MiniTest::Assertion
          end

          specify "with unequal count => pass" do
            expect([:a]).wont_equal_collection [:a, :a]
          end

        end

        describe "with hash" do

          specify "with equal count => fail" do
            expect { 
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
            expect {
              expect([:a, :b]).wont_equal_collection [:a, :b]
            }.must_raise MiniTest::Assertion
          end

          specify "with same items but different order => fail" do
            expect {
              expect([:a, :b]).wont_equal_collection [:b, :a]
            }.must_raise MiniTest::Assertion
          end

        end

        describe "with hash" do

          specify "with same items and same order => fail" do
            expect {
              expect({a: 1, b: 2}).wont_equal_collection({a: 1, b: 2})
            }.must_raise MiniTest::Assertion
          end

          specify "with same items and different order => fail" do
            expect {
              expect({a: 1, b: 2}).wont_equal_collection({b: 2, a: 1})
            }.must_raise MiniTest::Assertion
          end

        end

      end

      describe "with degenerate cases" do

        describe "with `actual` nil" do

          specify "raise" do
            expect {
              expect(nil).wont_equal_collection []
            }.must_raise MiniTest::Assertion
            begin
              expect(nil).wont_equal_collection []
            rescue MiniTest::Assertion => err
              expect(err.message).must_match(/\bactual\b.*\bnil\b/)
            end
          end

        end

        describe "with `expect` nil" do

          specify "raise" do
            expect {
              expect([]).wont_equal_collection nil
            }.must_raise MiniTest::Assertion
            begin
              expect([]).wont_equal_collection nil
            rescue MiniTest::Assertion => err
              expect(err.message).must_match(/\bexpect\b.*\bnil\b/)
            end
          end

        end

        describe "with `actual` that does not respond to each" do

          specify "raise" do
            expect {
              expect(Object.new).wont_equal_collection []
            }.must_raise MiniTest::Assertion
            begin
              expect(Object.new).wont_equal_collection []
            rescue MiniTest::Assertion => err
              expect(err.message).must_match(/\bactual\b.*\brespond to each\b/)
            end
          end

        end

        describe "with `expect` that does not respond to each" do

          specify "raise" do
            expect {
              expect([]).wont_equal_collection Object.new
            }.must_raise MiniTest::Assertion
            begin
              expect([]).wont_equal_collection Object.new
            rescue MiniTest::Assertion => err
              expect(err.message).must_match(/\bexpect\b.*\brespond to each\b/)
            end
          end

        end

      end

    end

  end 

end
