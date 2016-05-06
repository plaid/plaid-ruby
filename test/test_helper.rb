require 'minitest/autorun'
require 'webmock/minitest'

require 'plaid'

# Internal: Helpers to be included to the test classes.
module TestHelpers
  def fixture(name)
    File.new(File.dirname(__FILE__) + "/fixtures/#{name}.json")
  end

  def reset_config
    Plaid.config do |_|
    end
  end

  def tartan
    Plaid.config do |p|
      p.env = :tartan
    end
  end

  def full_test_credentials
    Plaid.config do |p|
      p.env = :tartan
      p.client_id = 'test_id'
      p.secret = 'test_secret'
    end
  end

  def stub_api(method, path, body: {}, query: {}, status: 200, response: nil,
               host: 'tartan.plaid.com')
    response = fixture(response) if response.is_a?(Symbol)

    headers = {}
    headers['Content-Type'] = 'application/x-www-form-urlencoded' \
      if method != :get

    expectations = {}
    expectations[:headers] = headers unless headers.empty?
    expectations[:body] = body unless body.empty?
    expectations[:query] = query unless query.empty?

    stub = stub_request(method, "https://#{host}/#{path}")
    stub = stub.with(expectations) unless expectations.empty?
    stub.to_return(status: status, body: response)
  end
end
