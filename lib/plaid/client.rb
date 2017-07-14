# Public: The Plaid namespace.
module Plaid
  # Public: The main interface to Plaid API.
  class Client
    # Public: All possible environments for the client to use.
    ENVIRONMENTS = %i(sandbox development production)

    # Public: The current environment in use (one of ENVIRONMENTS).
    attr_reader :env

    # Public: Construct a Client instance
    #
    # Optionally takes a block to allow overriding the default Faraday connection options.
    #
    # env        - The Symbol (:sandbox, :development, :production)
    # client_id  - The String Plaid account client ID to authenticate requests
    # secret     - The String Plaid account secret to authenticate requests
    # public_key - The String Plaid account public key to authenticate requests
    def initialize(env:, client_id:, secret:, public_key:, &block)
      @env        = env.to_sym
      @api_host   = api_host
      @client_id  = client_id
      @secret     = secret
      @public_key = public_key

      create_connection(&block)
    end

    extend SubproductMixin

    ##
    # Public: The Plaid::Accounts product accessor.
    subproduct :accounts

    ##
    # Public: The Plaid::Auth product accessor.
    subproduct :auth

    ##
    # Public: The Plaid::Categories product accessor.
    subproduct :categories

    ##
    # Public: The Plaid::CreditDetails product accessor.
    subproduct :credit_details

    ##
    # Public: The Plaid::Identity product accessor.
    subproduct :identity

    ##
    # Public: The Plaid::Income product accessor.
    subproduct :income

    ##
    # Public: The Plaid::Institutions product accessor.
    subproduct :institutions

    ##
    # Public: The Plaid::Item product accessor.
    subproduct :item

    ##
    # Public: The Plaid::Processor product accessor.
    subproduct :processor

    ##
    # Public: The Plaid::Sandbox product accessor.
    subproduct :sandbox

    ##
    # Public: The Plaid::Transactions product accessor.
    subproduct :transactions

    # Public: Make a post request
    #
    # path    - Path or URL to make the request to
    # payload - The payload or data to post
    #
    # Returns the resulting parsed JSON of the request
    def post(path, payload)
      @connection.post(path, payload).body
    end

    # Public: Make a post request with appended authentication fields
    #
    # path    - Path or URL to make the request to
    # payload - The payload or data to post
    #
    # Returns the resulting parsed JSON of the request
    def post_with_auth(path, payload)
      @connection.post(
        path,
        payload.merge(client_id: @client_id, secret: @secret)).body
    end

    # Public: Make a post request with appended public key field.
    #
    # path    - Path or URL to make the request to.
    # payload - The payload or data to post.
    #
    # Returns the resulting parsed JSON of the request.
    def post_with_public_key(path, payload)
      @connection.post(path, payload.merge(public_key: @public_key)).body
    end

    protected

    # Internal: subproduct-generated methods depend on client method.
    def client
      self
    end

    # Internal: Gets the API hostname for given environment.
    #
    # env - The Symbol (:sandbox, :development, :production)
    #
    # Returns a String representing the environment URL.
    # Raises ArgumentError if environment is unknown.
    def api_host
      unless ENVIRONMENTS.include?(@env)
        raise ArgumentError,
          "Invalid value for env (#{@env.inspect}): must be one of " +
          ENVIRONMENTS.map(&:inspect) * ', '
      end

      "https://#{@env}.plaid.com"
    end

    # Internal: Initializes a new Plaid connection object via Faraday.
    #
    # Optionally takes a block to allow overriding the defaults.
    def create_connection(&block)
      @connection = Faraday.new(url: @api_host) do |builder|
        block_given? ? yield(builder) : build_default_connection(builder)
      end
    end

    # Internal: Set Plaid defaults on the Faraday connection.
    #
    # builder - The Faraday builder object.
    def build_default_connection(builder)
      builder.options[:timeout] = Plaid::Middleware::NETWORK_TIMEOUT
      builder.headers = Plaid::Middleware::NETWORK_HEADERS
      builder.request :json
      builder.use Plaid::Middleware
      builder.response :json, content_type: /\bjson$/
      builder.adapter Faraday.default_adapter
    end
  end
end
