require_relative 'test_helper'

# Internal: The test for Plaid::Models::BaseModel.
class PlaidBaseModelTest < PlaidTest
  class SubModel < Plaid::Models::BaseModel
    property :baz
  end

  class TestModel < Plaid::Models::BaseModel
    property :foo
    property :sub, coerce: SubModel
  end

  def setup
    @strict_models = ENV['PLAID_STRICT_MODELS']
  end

  def teardown
    ENV['PLAID_STRICT_MODELS'] = @strict_models
  end

  def test_access
    model = TestModel.new({'foo' => 123, 'sub' => {'baz' => 456}})

    assert_equal 123, model['foo']
    assert_equal 123, model[:foo]
    assert_equal 123, model.foo

    assert_equal 456, model['sub']['baz']
    assert_equal 456, model[:sub][:baz]
    assert_equal 456, model.sub.baz
  end

  def test_unknown_attributes_in_strict_mode
    ENV['PLAID_STRICT_MODELS'] = '1'

    assert_raises(NoMethodError) do
      TestModel.new({'bar' => 123})
    end
  end

  def test_unknown_attributes_in_relaxed_mode
    ENV.delete('PLAID_STRICT_MODELS')

    model = TestModel.new({'bar' => 123})

    assert_equal 123, model['bar']
  end
end
