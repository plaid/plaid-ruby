module Plaid
  class Call

    BASE_URL = 'https://tartan.plaid.com'

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
      case raw_response.code
      when 200
        response                        = JSON.parse(raw_response)
        @parsed_response                = Hash.new

        @parsed_response[:code]         = raw_response.code
        @parsed_response[:access_token] = response["access_token"]
        @parsed_response[:accounts]     = response["accounts"]
        @parsed_response[:transactions] = response["transactions"]
        return @parsed_response
      when 201
        response                        = JSON.parse(raw_response)
        @parsed_response                = Hash.new

        @parsed_response[:code]         = raw_response.code
        @parsed_response[:type]         = response["type"]
        @parsed_response[:access_token] = response["access_token"]
        @parsed_response[:mfa_info]     = response["mfa_info"]
        return @parsed_response
      else
        @parsed_response                = Hash.new
        @parsed_response[:code]         = raw_response.code
        @parsed_response[:message]      = raw_response
        return @parsed_response
      end
    end

    def parse_place raw_response
      response                    = JSON.parse(raw_response)["entity"]
      @parsed_response            = Hash.new

      @parsed_response[:code]     = raw_response.code
      @parsed_response[:category] = response["category"]
      @parsed_response[:name]     = response["name"]
      @parsed_response[:id]       = response["_id"]
      @parsed_response[:phone]    = response["meta"]["contact"]["telephone"]
      @parsed_response[:location] = response["meta"]["location"]

      @parsed_response
    end

    private

    def post path, type, username, password, email, options = {}
      url = BASE_URL + path
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
      url = BASE_URL + path
      @response = RestClient.get url, params: {entity_id: id}
    end

  end
end
