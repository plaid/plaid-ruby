# Public: The Plaid namespace.
module Plaid
  # Internal: Map environment to Plaid environment URL
  #
  # env - The type of the environment in symbol form
  #
  # Returns a string representing an environment URL
  def self.url_from_env(env)
    case env
    when :sandbox
      'https://sandbox.plaid.com/'
    when :development
      'https://development.plaid.com/'
    when :production
      'https://production.plaid.com/'
    end
  end

  # Public: A class encapsulating client_id, secret, public key, and Plaid environment.
  class Client
    # Internal: Set Plaid environment to use
    #
    # Handles converting an env symbol into an environment URL
    #
    # env - The Symbol (:sandbox, :development, :production)
    #
    # Returns a string representing the environment URL or raises an error
    def env_map(env)
      (@env = Plaid.url_from_env(env)) || raise(ArgumentError, 'Invalid value for ' \
                                                                'Plaid::Client.env ' \
                                                                "(#{env.inspect}): " \
                                                                'must be :sandbox, '\
                                                                ':development, or :production ')
    end

    # Public: Memoized class instance to make requests from Plaid::Account
    def accounts
      @accounts ||= Plaid::Accounts.new(self)
    end

    # Public: Memoized class instance to make requests from Plaid::Auth
    def auth
      @auth ||= Plaid::Auth.new(self)
    end

    # Public: Memoized class instance to make requests from Plaid::Categories
    def categories
      @categories ||= Plaid::Categories.new(self)
    end

    # Public: Memoized class instance to make requests from Plaid::CreditDetails
    def credit_details
      @credit_details ||= Plaid::CreditDetails.new(self)
    end

    # Public: Memoized class instance to make requests from Plaid::Identity
    def identity
      @identity ||= Plaid::Identity.new(self)
    end

    # Public: Memoized class instance to make requests from Plaid::Income
    def income
      @income ||= Plaid::Income.new(self)
    end

    # Public: Memoized class instance to make requests from Plaid::Institutions
    def institutions
      @institutions ||= Plaid::Institutions.new(self)
    end

    # Public: Memoized class instance to make requests from Plaid::Item
    def item
      @item ||= Plaid::Item.new(self)
    end

    # Public: Memoized class instance to make requests from Plaid::Processor
    def processor
      @processor ||= Plaid::Processor.new(self)
    end

    # Public: Memoized class instance to make requests from Plaid::Sandbox
    def sandbox
      @sandbox ||= Plaid::Sandbox.new(self)
    end

    # Public: Memoized class instance to make requests from Plaid::Transactions
    def transactions
      @transactions ||= Plaid::Transactions.new(self)
    end

    # Public: Construct a Client instance
    #
    # Optionally takes a block to allow overriding the default Faraday connection options.
    #
    # env        - The Symbol (:sandbox, :development, :production)
    # client_id  - The String Plaid account client ID to authenticate requests
    # secret     - The String Plaid account secret to authenticate requests
    # public_key - The String Plaid account public key to authenticate requests
    def initialize(env:, client_id:, secret:, public_key:, &block)
      @env        = env_map(env)
      @client_id  = client_id
      @secret     = secret
      @public_key = public_key
      @connection = create_connection(&block)
    end

    # Internal: Initializes a new Plaid connection object via Faraday
    #
    # Optionally takes a block to allow overriding the defaults.
    def create_connection(&block)
      @connection = Faraday.new url: @env do |builder|
        block_given? ? yield(builder) : build_default_connection(builder)
      end
    end

    # Internal: Set Plaid defaults on the Faraday connection
    #
    # Handles converting an env symbol into an environment URL
    #
    # builder - The plaid connection object.
    def build_default_connection(builder)
      builder.options[:timeout] = Plaid::Middleware::NETWORK_TIMEOUT
      builder.headers = Plaid::Middleware::NETWORK_HEADERS
      builder.request :json
      builder.use Plaid::Middleware
      builder.response :json, content_type: /\bjson$/
      builder.adapter Faraday.default_adapter
    end

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
      auth = { client_id: @client_id,
               secret: @secret }
      @connection.post(path, payload.merge(auth)).body
    end

    # Public: Make a post request with appended public key field.
    #
    # path    - Path or URL to make the request to.
    # payload - The payload or data to post.
    #
    # Returns the resulting parsed JSON of the request.
    def post_with_public_key(path, payload)
      public_key = { public_key: @public_key }
      @connection.post(path, payload.merge(public_key)).body
    end
  end
end
