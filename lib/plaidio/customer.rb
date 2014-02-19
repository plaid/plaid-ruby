module Plaidio
  # This is used when a customer needs to be defined by the plaid access token. 
  # Abstracting as a class makes it easier since we wont have to redefine the access_token over and over.
  class Customer

    BASE_URL = 'https://tartan.plaid.com/'
    
    # This initializes our instance variables, and sets up a new Customer class. 
    def initialize()
      Plaidio::Configure::KEYS.each do |key|
        instance_variable_set(:"@#{key}", Plaidio.instance_variable_get(:"@#{key}"))
      end
    end

    def mfa_step(options={})
      # If the bank requires MFA, take the options and try to connect
    end

    def get_transactions
      # Get transactions, and return as json
    end

    def delete_account
      # Delete the account, and return a success item
    end

    protected

    def parse_response(response)
      # After the method has returned some response, parse and return to the method
    end

    private

    def get(path,options={})
      # All the get requests go here, and return to the original method
    end

    def post(path,options={})
      # All the post requests go here, and return to the original method
    end

    def delete(path,options={})
      # All the delete requests go here, and return to the original method
    end

    def send(options={})
      # We'll send all the requests out of here, so as not to repeat ourselves
    end
  end
end