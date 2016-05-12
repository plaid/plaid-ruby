require 'test_helper'

# Internal: The test for Plaid.config.
class PlaidConfigTest < MiniTest::Test
  def test_symbol_environments
    Plaid.config do |p|
      p.env = :tartan
    end

    assert_equal 'https://tartan.plaid.com/', Plaid.client.env

    Plaid.config do |p|
      p.env = :production
    end

    assert_equal 'https://api.plaid.com/', Plaid.client.env
  end

  def test_string_url
    Plaid.config do |p|
      p.env = 'https://www.example.com/'
    end

    assert_equal 'https://www.example.com/', Plaid.client.env
  end

  def test_wrong_values_for_env
    assert_raises ArgumentError do
      Plaid.config do |p|
        p.env = 123
      end
    end

    assert_raises ArgumentError do
      Plaid.config do |p|
        p.env = :unknown
      end
    end
  end
end
