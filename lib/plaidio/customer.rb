module Plaidio
  # This is used when a customer needs to be defined by the plaid access token.
  # Abstracting as a class makes it easier since we wont have to redefine the access_token over and over.
  class Customer

    BASE_URL = 'https://tartan.plaid.com/'

    # This initializes our instance variables, and sets up a new Customer class.
    def initialize(token)
      Plaidio::Configure::KEYS.each do |key|
        instance_variable_set(:"@#{key}", Plaidio.instance_variable_get(:"@#{key}"))
      end
      @token = token
    end

    def mfa_step(options={})
      # If the bank requires MFA, take the options and try to connect
    end

    def get_transactions
      get('/connect', token: @token)
      if @response.code != 200
        return RaiseError.new(@error_message)
      else
        return @response
      end
      # Get transactions, and return as json
    end

    def delete_account
      delete('/connect', token: @token)
      if @response.code != 200
        return RaiseError.new(@error_message)
      else
        return @response
      end
      # Delete the account, and return a success item
    end

    protected

    def parse_response(response)
      # After the method has returned some response, parse and return to the method
    end

    private

    def get(path,options={})
      url = BASE_URL + path
      @response = RestClient.get url, :client_id => self.instance_variable_get(:'@customer_id'), :secret => self.instance_variable_get(:'@secret'), :access_token => @token
      return @response
      # All the get requests go here, and return to the original method
    end

    def post(path,options={})
      # All the post requests go here, and return to the original method
    end

    def delete(path,options={})
      url = BASE_URL + path
      @response = RestClient.delete url, :client_id => self.instance_variable_get(:'@customer_id'), :secret => self.instance_variable_get(:'@secret'), :access_token => @token
      return @response
      # All the delete requests go here, and return to the original method
    end

    def send(options={})
      # We'll send all the requests out of here, so as not to repeat ourselves
    end
  end
end