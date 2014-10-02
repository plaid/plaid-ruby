module Plaid
  class Call

    ORIGIN = 'https://tartan.plaid.com'

    # This initializes our instance variables, and sets up a new Customer class.
    def initialize
      Plaid::Configure::KEYS.each do |key|
        instance_variable_set(:"@#{key}",
                              Plaid.instance_variable_get(:"@#{key}"))
      end
    end

    def add_account type, username, password, email, options = {}
      post '/connect', type, username, password, email, options
      parse_response @response
    end

    def get_place id
      get '/entities',id
      parse_place @response
    end


    protected

    def parse_response raw_response
      code = raw_response.code
      @parsed_response = {
        code: raw_response.code,
      }

      if code == 200
        response                        = JSON.parse(raw_response)
        @parsed_response[:access_token] = response['access_token']
        @parsed_response[:accounts]     = response['accounts']
        @parsed_response[:transactions] = response['transactions']
      elsif code == 201
        response                        = JSON.parse(raw_response)
        @parsed_response[:type]         = response['type']
        @parsed_response[:access_token] = response['access_token']
        @parsed_response[:mfa_info]     = response['mfa_info']
      else
        @parsed_response[:message]      = raw_response
      end

      @parsed_response
    end

    def parse_place raw_response
      response = JSON.parse(raw_response)['entity']
      @parsed_response = {
        code:      raw_response.code,
        category:  response['category'],
        name:      response['name'],
        id:        response['_id'],
        phone:     response['meta']['contact']['telephone'],
        location:  response['meta']['location'],
      }
    end

    private

    def post path, type, username, password, email, options = {}
      url = ORIGIN + path
      @response = RestClient.post url,
                                  client_id:   self.instance_variable_get(:'@customer_id'),
                                  secret:      self.instance_variable_get(:'@secret'),
                                  type:        type,
                                  credentials: { username: username,
                                                 password: password},
                                  email:       email,
                                  options:     options
    end

    def get path, id
      url = ORIGIN + path
      @response = RestClient.get url, params: {entity_id: id}
    end

  end
end
