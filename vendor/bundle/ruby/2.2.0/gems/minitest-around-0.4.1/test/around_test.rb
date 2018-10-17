require_relative 'helper'
require 'minitest/around/unit'

class TestWithoutAround < Minitest::Test
  def test_no_around_defined
    assert true
  end
end

class TestWithoutArgs < Minitest::Test
  def around
    $before = true
    yield
    $before = false # hard to test?
  end

  def test_runs_around
    assert_equal true, $before
  end
end
