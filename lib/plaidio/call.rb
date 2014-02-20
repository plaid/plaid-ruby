module Plaidio
  class Call

    BASE_URL = 'https://tartan.plaid.com/'
    
    # This initializes our instance variables, and sets up a new Customer class. 
    def initialize
      Plaidio::Configure::KEYS.each do |key|
        instance_variable_set(:"@#{key}", Plaidio.instance_variable_get(:"@#{key}"))
      end
    end

    def add_account(type,username,password,email)
      # Add an account to the customer, and return the json response
    end

    protected

    def parse_response(response)
      # After the method has returned some response, parse and return to the method
    end

    private

    def post(path,options={})
      # All the post requests go here, and return to the original method
    end

  end
end