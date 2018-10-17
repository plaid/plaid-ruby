require_relative 'helper'
require 'minitest/around/spec'

describe "Minitest Around" do
  describe "without around" do
    it "works w/o defining parameters" do
      assert true
    end
  end

  describe "simple" do
    around do |test|
      $before = true
      test.call
      $before = false
    end

    it "runs around" do
      $before.must_equal true
    end
  end

  describe "context" do
    before { @x = 1 }

    around do |test|
      @x = 2
      test.call
      assert_equal 2, @x
    end

    it "stays in context" do
      @x.must_equal 2
    end
  end

  describe "nested fun" do
    let(:list) { [] }
    before { list << 1 }
    before { list << 2 }
    after do
      if @xxx == 1
        list.must_equal [1, 2, 3, 4, 5, 9, 8, 7, 6]
      elsif @xxx == 2
        list.must_equal [1, 2, 3, 4, 5, 51, 9, 8, 7, 6]
      else
        raise
      end
    end
    after { list << 6 }
    around { |t| list << 3; t.call; list << 7 }
    before { list << 4 }
    around { |t| list << 5; t.call; list << 8 }
    after { list << 9 }

    it "orders" do
      @xxx = 1
      list.must_equal [1, 2, 3, 4, 5]
    end

    describe "more nesting fun" do
      before { list << 51 }

      it "orders" do
        @xxx = 2
        list.must_equal [1, 2, 3, 4, 5, 51]
      end
    end
  end

  describe "fail" do
    it "does not fail with fiber error" do
      output = spawn_test <<-RUBY
        describe "x" do
          around { raise ArgumentError }
          after { puts "AFTER" }
          it("x") { }
        end
      RUBY

      output.must_include "ArgumentError: ArgumentError"
      output.wont_include "FiberError"
    end
  end
end

def spawn_test(code)
  Tempfile.open("XX") do |f|
    f.write <<-RUBY
      require "#{File.expand_path("../helper", __FILE__)}"
      require 'minitest/around/spec'
      #{code}
    RUBY
    f.close
    `ruby #{f.path}`
  end
end
