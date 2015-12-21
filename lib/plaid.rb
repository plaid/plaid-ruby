require 'plaid/version'
require 'plaid/client'
require 'plaid/connection'
require 'plaid/errors'

require 'plaid/models/user'
require 'plaid/models/institution'
require 'plaid/models/category'
require 'plaid/models/exchange_token_response'

require 'json'

module Plaid

  def self.config
    connection = Plaid::Connection.new
    yield connection

    # Add trailing slash to api url if it is not present
    if connection.environment_location[-1] != '/'
      connection.environment_location += '/'
    end
    Plaid::Client.new(connection)
  end

end
