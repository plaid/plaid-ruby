module Plaid
  # Public: A class encapsulating client_id, secret, and Plaid API URL.
  class Client
    # Public: The String Plaid account client ID to authenticate requests.
    attr_accessor :client_id

    # Public: The String Plaid account secret to authenticate requests.
    attr_accessor :secret

    # Public: Plaid environment, i.e. String base URL of the API site.
    #
    # E.g. 'https://tartan.plaid.com'.
    attr_reader :env

    # Public: Set Plaid environment to use.
    #
    # env - The Symbol (:tartan, :production), or a full String URL like
    #       'https://tartan.plaid.com'.
    def env=(env)
      case env
      when :tartan
        @env = 'https://tartan.plaid.com/'
      when :production
        @env = 'https://api.plaid.com/'
      when String
        begin
          URI.parse(env)
          @env = env
        rescue
          raise ArgumentError, 'Invalid URL in Plaid::Client.env' \
                               " (#{env.inspect}). " \
                               'Specify either Symbol (:tartan, :production),' \
                               " or a full URL, like 'https://tartan.plaid.com'"
        end
      else
        raise ArgumentError, 'Invalid value for Plaid::Client.env' \
                             " (#{env.inspect}): " \
                             'must be :tartan, :production, or a full URL, ' \
                             "e.g. 'https://tartan.plaid.com'"
      end
    end

    # Public: Construct a Client instance.
    #
    # env       - The Symbol (:tartan, :production), or a full String URL like
    #             'https://tartan.plaid.com'.
    # client_id - The String Plaid account client ID to authenticate requests.
    # secret    - The String Plaid account secret to authenticate requests.
    def initialize(env: nil, client_id: nil, secret: nil)
      env && self.env = env
      self.client_id = client_id
      self.secret = secret
    end

    # Public: Check if client_id is configured.
    #
    # Returns true if it is.
    def client_id_configured?
      @client_id.is_a?(String) && !@client_id.empty?
    end

    # Public: Check if client_id is configured.
    #
    # Returns true if it is.
    def secret_configured?
      @secret.is_a?(String) && !@secret.empty?
    end
  end
end
