module Plaid
  # This is used when a customer needs to be defined by the plaid access token.
  # Abstracting as a class makes it easier since we wont have to redefine the access_token over and over.
  class Customer

    BASE_URL = 'https://tartan.plaid.com'

    # This initializes our instance variables, and sets up a new Customer class.
    def initialize
      Plaid::Configure::KEYS.each do |key|
        instance_variable_set(:"@#{key}", Plaid.instance_variable_get(:"@#{key}"))
      end
    end

    def mfa_auth_step(access_token, code, type)
      parse_response(post('/auth/step', access_token, mfa: code, type: type), 0)
    end

    def mfa_connect_step(access_token, code, type)
      parse_response(post('/connect/step', access_token, mfa: code, type: type), 1)
    end

    def get_transactions(access_token)
      parse_response(get('/connect', access_token),2)
    end

    def delete_account(access_token)
      parse_response(delete('/connect', access_token),3)
    end

    protected

    def parse_response(response,method)
      parsed = JSON.parse(response)
      if response.code == '200'
        case method
        when 0
          {code: response.code, access_token: parsed['access_token'], accounts: parsed['accounts']}
        when 1
          {code: response.code, access_token: parsed['access_token'], accounts: parsed['accounts'], transactions: parsed['transactions']}
        when 2
          {code: response.code, transactions: parsed['transactions']}
        else
          {code: response.code, message: parsed}
        end
      else
        {code: response.code, message: parsed}
      end
    end

    private

    def get(path,access_token)
      url = BASE_URL + path
      RestClient.get(url, params: {client_id: self.instance_variable_get(:'@customer_id'), secret: self.instance_variable_get(:'@secret'), access_token: access_token})
    end

    def post(path,access_token,options={})
      url = BASE_URL + path
      RestClient.post url, client_id: self.instance_variable_get(:'@customer_id'), secret: self.instance_variable_get(:'@secret'), access_token: access_token, mfa: options[:mfa], type: options[:type]
    end

    def delete(path,access_token)
      url = BASE_URL + path
      RestClient.delete(url, params: {client_id: self.instance_variable_get(:'@customer_id'), secret: self.instance_variable_get(:'@secret'), access_token: access_token})
    end
  end
end