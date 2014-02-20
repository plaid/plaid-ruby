module Plaidio
  class Call

    BASE_URL = 'https://tartan.plaid.com/'
    
    # This initializes our instance variables, and sets up a new Customer class. 
    def initialize
      Plaidio::Configure::KEYS.each do |key|
        instance_variable_set(:"@#{key}", Plaidio.instance_variable_get(:"@#{key}"))
      end
    end

    def add_account(path,type,credentials,email)
      post('/connect',type,credentials,email)
      return parse_response(response)
    end

    protected

    def parse_response(response)
      return "Success"
    end

    private

    def post(path,options={})
      # All the post requests go here, and return to the original method
    end

  end
end