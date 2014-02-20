module Plaidio
  require 'rest-client'
  class Call

    BASE_URL = 'https://tartan.plaid.com/'
    
    # This initializes our instance variables, and sets up a new Customer class. 
    def initialize
      Plaidio::Configure::KEYS.each do |key|
        instance_variable_set(:"@#{key}", Plaidio.instance_variable_get(:"@#{key}"))
      end
    end

    def add_account(type,username,password,email)
      post('/connect',type,username,password,email)
      if @response.code != 200
        return RaiseError.new(@error_message)
      else 
        return @response
      end
    end

    private

    def post(path,type,username,password,email)
      url = BASE_URL + path
      @response = RestClient.post url, :client_id => self.instance_variable_get(:'@customer_id') ,:secret => self.instance_variable_get(:'@secret'), :type => type ,:credentials => {:username => username, :password => password} ,:email => email
      return @response
    end
    
  end
end