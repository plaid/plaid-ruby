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
    @relaxed_models = Plaid.relaxed_models?
  end

  def teardown
    Plaid.relaxed_models = @relaxed_models
  end

  def test_access
    model = TestModel.new('foo' => 123, 'sub' => { 'baz' => 456 })

    assert_equal 123, model['foo']
    assert_equal 123, model[:foo]
    assert_equal 123, model.foo

    assert_equal 456, model['sub']['baz']
    assert_equal 456, model[:sub][:baz]
    assert_equal 456, model.sub.baz
  end

  def test_unknown_attributes_in_strict_mode
    Plaid.relaxed_models = false

    assert_raises(NoMethodError) do
      TestModel.new('bar' => 123)
    end

    model = TestModel.new('foo' => 123)

    assert_raises(NoMethodError) do
      model['abc']
    end

    assert_raises(NoMethodError) do
      model.abc
    end
  end

  def test_unknown_attributes_in_relaxed_mode
    Plaid.relaxed_models = true

    model = TestModel.new('bar' => 123)

    assert_equal 123, model['bar']
  end

  def test_error_with_causes
    response = {
      error_type: 'API_ERROR',
      error_code: 'INTERNAL_SERVER_ERROR',
      error_message: 'an unexpected error occurred',
      causes: [
        {
          item_id: '456',
          error_type: 'API_ERROR',
          error_code: 'INTERNAL_SERVER_ERROR',
          error_message: 'an unexpected error occurred'
        }
      ]
    }
    error = Plaid::Models::Error.new(response)

    assert_equal error.causes.length, 1

    cause = error.causes[0]
    assert_equal cause.item_id, '456'
    assert_equal cause.error_type, 'API_ERROR'
    assert_equal cause.error_code, 'INTERNAL_SERVER_ERROR'
    assert_equal cause.error_message, 'an unexpected error occurred'
  end
end
