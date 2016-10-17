require_relative 'account'

module Plaid
  # Public: A class which encapsulates the authenticated user for all Plaid
  # products.
  class User
    # Public: The access token for authenticated user.
    attr_reader :access_token

    # Public: The processor token for a given account and authenticated user.
    attr_reader :processor_token

    # Public: The current product. Provides a context for #update and #delete
    # calls. See Plaid::PRODUCTS.
    attr_reader :product

    # Public: The Array of Account instances providing accounts information
    # for the user.
    attr_reader :accounts

    # Public: The Array of Transactions provided by initial call to User.create.
    #
    # If the :login_only option of User.create is set to false, the initial
    # 30-day transactional data are returned during the API call. This attribute
    # contains them.
    attr_reader :initial_transactions

    # Public: The Symbol MFA type to be used (or nil, if no MFA required).
    #
    # E.g. :questions, :list, or :device.
    attr_reader :mfa_type

    # Public: The MFA data (Hash or Array of Hash) or nil, if no MFA required.
    #
    # E.g. [{ question: "What was the name of your first pet?" }]
    # or
    # [{ mask: 't..t@plaid.com', type: 'email' },
    #  { mask: 'xxx-xxx-5309',   type: 'phone' }]
    # or
    # { message: 'Code sent to xxx-xxx-5309' }
    attr_reader :mfa

    # Public: The String stripe bank account token.
    #
    # This field is set when you use User.exchange_token to convert Link
    # public_token into an access token suitable for Plaid API.
    attr_reader :stripe_bank_account_token

    # Internal: The Plaid::Client instance used to make queries.
    attr_reader :client

    # Public: Create (add) a user.
    #
    # product     - The Symbol product name you are adding the user to, one of
    #               Plaid::PRODUCTS (e.g. :info, :connect, etc.).
    # institution - The String/Symbol financial institution type that you
    #               want to access (e.g. :wells).
    # username    - The String username associated with the financial
    #               institution.
    # password    - The String password associated with the financial
    #               institution.
    # pin         - The String PIN number associated with the financial
    #               institution (default: nil).
    # options     - the Hash options (default: {}):
    #               :list       - The Boolean flag which would request the
    #                             available send methods if the institution
    #                             requires code-based MFA credential (default:
    #                             false).
    #               :webhook    - The String webhook URL. Used with :connect,
    #                             :income, and :risk products (default: nil).
    #               :pending    - The Boolean flag requesting to return
    #                             pending transactions. Used with :connect
    #                             product (default: false).
    #               :login_only - The Boolean option valid for initial
    #                             authentication only. If set to false, the
    #                             initial request will return transaction data
    #                             based on the start_date and end_date.
    #               :start_date - The start Date from which to return
    #                             transactions (default: 30 days ago).
    #               :end_date   - The end Date to which transactions
    #                             will be collected (default: today).
    # client      - The Plaid::Client instance used to connect to the API
    #               (default is to use global Plaid client - Plaid.client).
    #
    # Returns a Plaid::User instance.
    def self.create(product, institution, username, password,
                    pin: nil, options: nil, client: nil)
      check_product product

      payload = { username: username, password: password,
                  type: institution.to_s }
      payload[:pin] = pin if pin
      payload[:options] = MultiJson.dump(options) if options

      conn = Connector.new(product, auth: true, client: client)
      resp = conn.post(payload)

      new product, response: resp, mfa: conn.mfa?, client: client
    end

    # Public: Get User instance in case user access token is known.
    #
    # No requests are made, but the returned User instance is ready to be
    # used.
    #
    # product - The Symbol product name you want to use, one of
    #           Plaid::PRODUCTS (e.g. :info, :connect, etc.).
    # token   - The String access token for the user.
    # client  - The Plaid::Client instance used to connect to the API
    #           (default is to use global Plaid client - Plaid.client).
    #
    # Returns a Plaid::User instance.
    def self.load(product, token, client: nil)
      new check_product(product), access_token: token, client: client
    end

    # Public: Exchange a Link public_token for an API access_token.
    #
    # The account_id parameter is required if you wish to receive a Stripe bank
    # account token.
    #
    # public_token - The String Link public_token.
    # account_id   - The String account ID.
    # product      - The Symbol product name (default: :connect).
    # client       - The Plaid::Client instance used to connect to the API
    #                (default is to use global Plaid client - Plaid.client).
    #
    # Returns a new User with access token obtained from Plaid and default
    # product set to product. User#stripe_bank_account_token for this user
    # instance will contain the Stripe token.
    def self.exchange_token(public_token, account_id = nil,
                            product: :connect, client: nil)
      check_product product

      payload = { public_token: public_token }
      payload[:account_id] = account_id if account_id

      response = Connector.new(:exchange_token, auth: true, client: client)
                          .post(payload)

      stripe_token = account_id && response['stripe_bank_account_token']
      new product, response: response, client: client,
                   stripe_token: stripe_token
    end

    # Internal: Initialize a User instance.
    #
    # product      - The Symbol product name.
    # access_token - The String access token obtained from Plaid.
    # response     - The Hash response body to parse.
    # mfa          - The Boolean flag indicating that response body
    #                contains an MFA response.
    # stripe_token - The String stripe bank account token.
    # client       - The Plaid::Client instance used to connect to the API
    #                (default is to use global Plaid client - Plaid.client).
    def initialize(product, access_token: nil, response: nil, mfa: nil,
                   stripe_token: nil, client: nil)
      @product = product
      @client = client
      @access_token = access_token if access_token
      @mfa_required = mfa
      @stripe_bank_account_token = stripe_token
      @accounts = @initial_transactions = @info = @risk = @income = nil

      parse_response(response) if response
    end

    # Public: Find out if MFA is required based on last request.
    #
    # After calling e.g. User.create you might need to make an additional
    # authorization step if MFA is required by the financial institution.
    #
    # Returns true if this step is needed, a falsey value otherwise.
    def mfa?
      @mfa_required
    end

    # Public: Submit MFA information.
    #
    # info        - The String with MFA information (default: nil).
    # send_method - The Hash with code send method information.
    #               E.g. { type: 'phone' } or { mask: '123-...-4321' }.
    #               Default is first available email.
    # options     - the Hash options (default: {}):
    #               :list       - The Boolean flag which would request the
    #                             available send methods if the institution
    #                             requires code-based MFA credential (default:
    #                             false).
    #               :webhook    - The String webhook URL. Used with :connect,
    #                             :income, and :risk products (default: nil).
    #               :pending    - The Boolean flag requesting to return
    #                             pending transactions. Used with :connect
    #                             product (default: false).
    #               :login_only - The Boolean option valid for initial
    #                             authentication only. If set to false, the
    #                             initial request will return transaction data
    #                             based on the start_date and end_date.
    #               :start_date - The start Date from which to return
    #                             transactions (default: 30 days ago).
    #               :end_date   - The end Date to which transactions
    #                             will be collected (default: today).
    #
    # Returns true if whole MFA process is completed, false otherwise.
    def mfa_step(info = nil, send_method: nil, options: nil)
      payload = { access_token: access_token }
      payload[:mfa] = info if info
      if options || send_method
        options = {} unless options
        options[:send_method] = send_method if send_method
        payload[:options] = MultiJson.dump(options)
      end
      conn = Connector.new(product, :step, auth: true)

      # Use PATCH if we are in context of User#update.
      response = if @mfa_patch
                   conn.patch(payload)
                 else
                   conn.post(payload)
                 end

      @mfa_required = conn.mfa?
      parse_response(response)
    end

    # Public: Get transactions.
    #
    # Does a /connect/get call. Updates self.accounts with latest information.
    #
    # pending    - the Boolean flag requesting to return pending transactions.
    # account_id - the String Account ID (default: nil). If this argument is
    #              present, only transactions for given account will be
    #              requested.
    # start_date - The start Date (inclusive).
    # end_date   - The end Date (inclusive).
    #
    # Returns an Array of Transaction records.
    def transactions(pending: false, account_id: nil,
                     start_date: nil, end_date: nil)
      options = { pending: pending }
      options[:account] = account_id if account_id
      options[:gte] = start_date.to_s if start_date
      options[:lte] = end_date.to_s if end_date

      response = Connector.new(:connect, :get, auth: true, client: client)
                          .post(access_token: access_token,
                                options: MultiJson.dump(options))
      update_accounts(response)
      build_objects(response['transactions'], Transaction)
    end

    # Public: Update user credentials.
    #
    # Updates the user credentials for the current product. See
    # User#for_product.
    #
    # username    - The String username associated with the financial
    #               institution.
    # password    - The String password associated with the financial
    #               institution.
    # pin         - The String PIN number associated with the financial
    #               institution (default: nil).
    #
    # Returns self.
    def update(username, password, pin = nil)
      payload = {
        access_token: access_token,
        username: username,
        password: password
      }

      payload[:pin] = pin if pin

      conn = Connector.new(product, auth: true, client: client)
      resp = conn.patch(payload)

      if conn.mfa?
        @mfa_required = true
      end

      parse_response(resp)

      # A note for User#mfa_step to send PATCH request too
      @mfa_patch = true

      self
    end

    # Public: Create or update the webhook for Connect.
    #
    # Does a PATCH /connect request.
    #
    # webhook - The String with webhook URL.
    #
    # Returns self.
    def update_webhook(webhook)
      raise ArgumentError, 'User#update_webhook only supported by Connect!' \
        unless product == :connect

      payload = {
        access_token: access_token,
        options: MultiJson.dump(webhook: webhook)
      }

      parse_response(Connector.new(:connect, auth: true, client: client)
                              .patch(payload))
      self
    end

    # Public: Delete the user.
    #
    # Makes a delete request and freezes self to prevent further modifications
    # to the object.
    #
    # Returns self.
    def delete
      Connector.new(product, auth: true, client: client)
               .delete(access_token: access_token)

      freeze
    end

    # Public: Upgrade the user.
    #
    # For an existing user that has been added via any of products (:connect,
    # :auth, :income, :info, or :risk), you can upgrade that user to have
    # functionality with other products.
    #
    # Does a POST /upgrade request.
    #
    # See also User#for_product.
    #
    # product - The Symbol product name you are upgrading the user to, one of
    #           Plaid::PRODUCTS.
    #
    # Returns another User record with the same access token, but tied to the
    # new product.
    def upgrade(product)
      payload = { access_token: access_token, upgrade_to: product.to_s }
      response = Connector.new(:upgrade, auth: true, client: client)
                          .post(payload)

      User.new product, response: response, client: client
    end

    # Public: Get the current user tied to another product.
    #
    # No API request is made, just the current product is changed.
    #
    # product - The Symbol product you are selecting, one of Plaid::PRODUCTS.
    #
    # See also User#upgrade.
    #
    # Returns a new User instance.
    def for_product(product)
      User.load product, access_token, client: client
    end

    # Public: Get auth information for the user (routing numbers for accounts).
    #
    # Not only this method returns the new data, but it updates self.accounts as
    # well.
    #
    # The method does a POST /auth/get request.
    #
    # sync - The Boolean flag which, if true, causes auth information to be
    #        rerequested from the server. Otherwise cached version is returned,
    #        if it exists.
    #
    # Returns an Array of Account with numbers baked in.
    def auth(sync: false)
      if sync || !@accounts || !@accounts[0] || !@accounts[0].numbers
        response = Connector.new(:auth, :get, auth: true, client: client)
                            .post(access_token: access_token)

        update_accounts(response)
      end

      accounts
    end

    # Public: Get info for the user.
    #
    # Does a POST /info/get request.
    #
    # sync - The Boolean flag which, if true, causes information to be
    #        rerequested from the server. Otherwise cached version is returned,
    #        if it exists.
    #
    # Returns a Plaid::Info instance.
    def info(sync: false)
      if sync || !@info
        parse_response(Connector.new(:info, :get, auth: true, client: client)
                                .post(access_token: access_token))
      end

      @info
    end

    # Public: Get income information for the user.
    #
    # Does a POST /income/get request.
    #
    # sync - The Boolean flag which, if true, causes income information to be
    #        rerequested from the server. Otherwise cached version is returned,
    #        if it exists.
    #
    # Returns a Plaid::Income instance.
    def income(sync: false)
      if sync || !@income
        parse_response(Connector.new(:income, :get, auth: true, client: client)
                                .post(access_token: access_token))
      end

      @income
    end

    # Public: Get risk data for the user's accounts.
    #
    # Does a POST /risk/get request.
    #
    # sync - The Boolean flag which, if true, causes risk information to be
    #        rerequested from the server. Otherwise cached version is returned,
    #        if it exists.
    #
    # Returns an Array of accounts with risk attribute set.
    def risk(sync: false)
      if sync || !@accounts || !@accounts[0] || !@accounts[0].risk
        parse_response(Connector.new(:risk, :get, auth: true, client: client)
                                .post(access_token: access_token))
      end

      @accounts
    end

    # Public: Get current account balance.
    #
    # Does a POST /balance request.
    #
    # Returns an Array of Plaid::Account.
    def balance
      response = Connector.new(:balance, auth: true, client: client)
                          .post(access_token: access_token)

      update_accounts(response)
    end

    private

    # Internal: Validate the product name.
    def self.check_product(product)
      if Plaid::PRODUCTS.include?(product)
        product
      else
        raise ArgumentError, "product (#{product.inspect}) must be one of " \
                             "Plaid products (#{Plaid::PRODUCTS.inspect})"
      end
    end

    private_class_method :check_product

    # Internal: Set up attributes from Add User response.
    def parse_response(response)
      @access_token = response['access_token']
      @processor_token = response['processor_token']

      return parse_mfa_response(response) if mfa?

      @mfa_type = @mfa = nil

      update_accounts(response) if response['accounts']

      if (trans = response['transactions'])
        @initial_transactions = build_objects(trans, Transaction)
      end

      if (income = response['income'])
        @income = Plaid::Income.new(income)
      end

      return unless (i = response['info'])
      @info = Plaid::Info.new(i)
    end

    # Internal: Parse an MFA response
    def parse_mfa_response(response)
      @mfa_type = response['type'].to_sym
      @mfa = Plaid.symbolize_hash(response['mfa'])
    end

    # Internal: Convert an array of data into an array of objects, encapsulating
    # that data.
    def build_objects(data, klass)
      data ? data.map { |element| klass.new(element) } : []
    end

    # Internal: Update account data from the response.
    def update_accounts(response)
      new_accounts = build_objects(response['accounts'], Account)

      if @accounts
        Account.merge @accounts, new_accounts
      else
        @accounts = new_accounts
      end
    end
  end
end
