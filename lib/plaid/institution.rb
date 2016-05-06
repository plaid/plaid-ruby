module Plaid
  # Public: A class encapsulating information about a Financial Institution
  # supported by Plaid.
  class Institution
    # Public: The String institution ID. E.g. "5301a93ac140de84910000e0".
    attr_reader :id

    # Public: The String institution name. E.g. "Bank of America".
    attr_reader :name

    # Public: The String institution shortname, or "type" per Plaid API docs.
    # E.g. "bofa".
    attr_reader :type

    # Public: The Boolean flag telling if the institution requires MFA.
    attr_reader :has_mfa

    # Public: Returns true if the institution requires MFA.
    alias has_mfa? has_mfa

    # Public: The Hash with MFA options available. E.g. ["code", "list",
    # "questions(3)"]. This means that you are allowed to request a list of
    # possible MFA options, use code-based MFA and questions MFA (there are 3
    # questions).
    attr_reader :mfa

    # Public: The Hash with credential labels, how they are exactly named by
    # the institution. E.g. {"username": "Online ID", "password": "Password"}.
    attr_reader :credentials

    # Public: An Array with Symbol product names supported by the institution.
    # E.g. [:connect, :auth, :balance, :info, :income, :risk]. See
    # Plaid::PRODUCTS.
    attr_reader :products

    # Internal: Initialize an Institution with given fields.
    def initialize(fields)
      @id = fields['id']
      @name = fields['name']
      @type = fields['type']
      @has_mfa = fields['has_mfa']
      @mfa = fields['mfa']
      @credentials = fields['credentials']
      @products = fields['products'].map(&:to_sym)
    end

    # Public: Get a String representation of the institution.
    #
    # Returns a String.
    def inspect
      "#<Plaid::Institution id=#{id.inspect}, type=#{type.inspect}, " \
      "name=#{name.inspect}>"
    end

    # Public: Get a String representation of the institution.
    #
    # Returns a String.
    alias to_s inspect

    # Public: Get information about the Financial Institutions currently
    # supported by Plaid.
    #
    # Does a GET /institutions call.
    #
    # client - The Plaid::Client instance used to connect
    #          (default: Plaid.client).
    #
    # Returns an Array of Institution instances.
    def self.all(client: nil)
      Connector.new(:institutions, client: client).get.map do |idata|
        new(idata)
      end
    end

    # Public: Get information about a given Financial Institution.
    #
    # Does a GET /institutions/:id call.
    #
    # id     - the String institution ID (e.g. "5301a93ac140de84910000e0").
    # client - The Plaid::Client instance used to connect
    #          (default: Plaid.client).
    #
    # Returns an Institution instance or raises Plaid::NotFoundError if
    # institution with given id is not found.
    def self.get(id, client: nil)
      new Connector.new(:institutions, id, client: client).get
    end
  end

  ##############################################################################

  # Public: A class encapsulating information about a "long tail" Financial
  # Institution supported by Plaid.
  class LongTailInstitution
    # Public: The String ID of the institution. Same as type. E.g. "bofa".
    attr_reader :id

    # Public: The String short name ("type") of the institution. E.g. "bofa".
    attr_reader :type

    # Public: The String institution name. E.g. "Bank of America".
    attr_reader :name

    # Public: The Hash with supported products as keys and booleans as values.
    #
    # E.g. { auth: true, balance: true, connect: true, info: true }.
    attr_reader :products

    # Public: The String "forgotten password" URL.
    attr_reader :forgotten_password_url

    # Public: The String "account locked" URL.
    attr_reader :account_locked_url

    # Public: The String "account setup" URL.
    attr_reader :account_setup_url

    # Public: The String video (???).
    attr_reader :video

    # Public: The Array of Hashes with login fields information.
    #
    # E.g. [{ name: 'username', label: 'Online ID', type: 'text' },
    #       { name: 'password', label: 'Password', type: 'password' }].
    attr_reader :fields

    # Public: The Hash with color information for the institution.
    #
    # E.g. { primary: 'rgba(220,20,48,1)',
    #        darker: 'rgba(180,11,35,1)',
    #        gradient: ['rgba(250,20,51,1)', 'rgba(227,24,55,1)'] }.
    attr_reader :colors

    # Public: The String with base64 encoded logo.
    attr_reader :logo

    # Public: ???.
    attr_reader :name_break

    # Internal: Initialize the LongTailInstitution instance.
    def initialize(hash)
      %w(id type name video logo).each do |f|
        instance_variable_set "@#{f}", hash[f]
      end

      @products = Plaid.symbolize_hash(hash['products'])
      @forgotten_password_url = hash['forgottenPassword']
      @account_locked_url = hash['accountLocked']
      @account_setup_url = hash['accountSetup']
      @fields = hash['fields'].map { |fld| Plaid.symbolize_hash(fld) }
      @colors = Plaid.symbolize_hash(hash['colors'])
      @name_break = hash['nameBreak']
    end

    # Public: Get a String representation of the institution.
    #
    # Returns a String.
    def inspect
      "#<Plaid::LongTailInstitution id=#{id.inspect}, name=#{name.inspect}, " \
        '...>'
    end

    # Public: Get a String representation of the institution.
    #
    # Returns a String.
    alias to_s inspect

    # Public: Lookup a "long tail" Financial Institution by ID.
    #
    # Does a GET /institutions/search call with id param.
    #
    # id - the String institution ID (e.g. 'bofa').
    # client - The Plaid::Client instance used to connect
    #          (default: Plaid.client).
    #
    # Returns an Institution instance or nil if institution with given id is not
    # found.
    def self.get(id, client: nil)
      client ||= Plaid.client

      # If client_id is set, use it, no authentication otherwise
      auth = client && !client.client_id.nil?
      conn = Connector.new(:institutions, :search, auth: auth, client: client)
      resp = conn.get(id: id)

      case resp
      when Hash
        new resp
      when Array
        raise 'Non-empty array returned by /institutions/search with id' \
          unless resp.empty?

        nil
      else
        raise 'Unexpected result returned by /institutions/search with id: ' \
          "#{resp.inspect}"
      end
    end

    # Public: Get information about the "long tail" institutions supported
    # by Plaid via partnerships.
    #
    # Does a POST /institutions/longtail call.
    #
    # count  - The Integer number of results to retrieve (default: 50).
    # offset - The Integer number of results to skip forward from the
    #          beginning of the list (default: 0).
    # client - The Plaid::Client instance used to connect
    #          (default: Plaid.client).
    #
    # Returns an Array of LongTailInstitution instances.
    def self.all(count: 50, offset: 0, client: nil)
      conn = Connector.new(:institutions, :longtail, auth: true, client: client)
      resp = conn.post(count: count, offset: offset)
      resp.map { |lti_data| new(lti_data) }
    end

    # Public: Search "long tail" institutions.
    #
    # query   - The String search query to match against the full list of
    #           institutions. Partial matches are returned making this useful
    #           for autocompletion purposes.
    # product - The Symbol product name to filter by, one of Plaid::PRODUCTS
    #           (e.g. :info, :connect, etc.). Only valid when query is
    #           specified. If nil, results are not filtered by product
    #           (default: nil).
    # client - The Plaid::Client instance used to connect
    #          (default: Plaid.client).
    def self.search(query: nil, product: nil, client: nil)
      raise ArgumentError, 'query must be specified' \
        unless query.is_a?(String) && !query.empty?

      payload = { q: query }
      payload[:p] = product.to_s if product

      resp = Connector.new(:institutions, :search, client: client).get(payload)
      resp.map { |lti_data| new(lti_data) }
    end
  end
end
