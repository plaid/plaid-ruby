=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.391.1

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.1.0

=end

require 'date'
require 'time'

module Plaid
  # LinkTokenCreateRequest defines the request schema for `/link/token/create`
  class LinkTokenCreateRequest
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    attr_accessor :client_id

    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    attr_accessor :secret

    # The name of your application, as it should be displayed in Link. Maximum length of 30 characters. If a value longer than 30 characters is provided, Link will display \"This Application\" instead.
    attr_accessor :client_name

    # The language that Link should be displayed in. When initializing with Identity Verification, this field is not used; for more details, see [Identity Verification supported languages](https://www.plaid.com/docs/identity-verification/#supported-languages).  Supported languages are: - Danish (`'da'`) - Dutch (`'nl'`) - English (`'en'`) - Estonian (`'et'`) - French (`'fr'`) - German (`'de'`) - Italian (`'it'`) - Latvian (`'lv'`) - Lithuanian (`'lt'`) - Norwegian (`'no'`) - Polish (`'pl'`) - Portuguese (`'pt'`) - Romanian (`'ro'`) - Spanish (`'es'`) - Swedish (`'sv'`)  When using a Link customization, the language configured here must match the setting in the customization, or the customization will not be applied.
    attr_accessor :language

    # Specify an array of Plaid-supported country codes using the ISO-3166-1 alpha-2 country code standard. Institutions from all listed countries will be shown. For a complete mapping of supported products by country, see https://plaid.com/global/.  If Link is launched with multiple country codes, only products that you are enabled for in all countries will be used by Link. Note that while all countries are enabled by default in Sandbox and Development, in Production only US and Canada are enabled by default. Access to European institutions requires additional compliance steps. To request access to European institutions in the Production environment, [file a product access Support ticket](https://dashboard.plaid.com/support/new/product-and-development/product-troubleshooting/request-product-access) via the Plaid dashboard. If you initialize with a European country code, your users will see the European consent panel during the Link flow.  If using a Link customization, make sure the country codes in the customization match those specified in `country_codes`, or the customization may not be applied.  If using the Auth features Instant Match, Same-day Micro-deposits, or Automated Micro-deposits, `country_codes` must be set to `['US']`.
    attr_accessor :country_codes

    attr_accessor :user

    # List of Plaid product(s) you wish to use. If launching Link in update mode, should be omitted (unless you are using update mode to add Income or Assets to an Item); required otherwise.  `balance` is *not* a valid value, the Balance product does not require explicit initialization and will automatically be initialized when any other product is initialized.  The products specified here will determine which institutions will be available to your users in Link. Only institutions that support *all* requested products can be selected; a if a user attempts to select an institution that does not support a listed product, a \"Connectivity not supported\" error message will appear in Link. To maximize the number of institutions available, initialize Link with the minimal product set required for your use case. Additional products can be included via the [`required_if_supported_products`](https://plaid.com/docs/api/tokens/#link-token-create-request-required-if-supported-products) field, or can be initialized by calling the endpoint after obtaining an access token. For details and exceptions, see [Choosing when to initialize products](https://plaid.com/docs/link/initializing-products/).  Note that, unless you have opted to disable Instant Match support, institutions that support Instant Match will also be shown in Link if `auth` is specified as a product, even though these institutions do not contain `auth` in their product array.  In Production, you will be billed for each product that you specify when initializing Link. Note that a product cannot be removed from an Item once the Item has been initialized with that product. To stop billing on an Item for subscription-based products, such as Liabilities, Investments, and Transactions, remove the Item via `/item/remove`.
    attr_accessor :products

    # (Beta) This field has no effect unless you are participating in the [Data Transparency](https://plaid.com/docs/link/data-transparency-messaging-migration-guide) beta program. List of additional Plaid product(s) you wish to collect consent for. These products will not be billed until you start using them by calling the relevant endpoints.  `balance` is *not* a valid value, the Balance product does not require explicit initialization and will automatically have consent collected.  Institutions that do not support these products will still be shown in Link
    attr_accessor :additional_consented_products

    # List of Plaid product(s) you wish to use only if the institution and account(s) selected by the user support the product. Institutions that do not support these products will still be shown in Link. The products will only be extracted and billed if the user selects an institution and account type that supports them.  There should be no overlap between `products` and `required_if_supported_products`. The `products` array must have at least one product.  For more details on using this feature, see [Required if Supported Products](https://www.plaid.com/docs/link/initializing-products/#required-if-supported-products).
    attr_accessor :required_if_supported_products

    # The destination URL to which any webhooks should be sent. Note that webhooks for Payment Initiation (e-wallet transactions only), Transfer, Bank Transfer (including Auth micro-deposit notification webhooks) and Identity Verification are configured via the Dashboard instead.
    attr_accessor :webhook

    # The `access_token` associated with the Item to update or reference, used when updating, modifying, or accessing an existing `access_token`. Used when launching Link in update mode, when completing the Same-day (manual) Micro-deposit flow, or (optionally) when initializing Link for a returning user as part of the Transfer UI flow.
    attr_accessor :access_token

    # The name of the Link customization from the Plaid Dashboard to be applied to Link. If not specified, the `default` customization will be used. When using a Link customization, the language in the customization must match the language selected via the `language` parameter, and the countries in the customization should match the country codes selected via `country_codes`.
    attr_accessor :link_customization_name

    # A URI indicating the destination where a user should be forwarded after completing the Link flow; used to support OAuth authentication flows when launching Link in the browser or via a webview. The `redirect_uri` should not contain any query parameters. When used in Production or Development, must be an https URI. To specify any subdomain, use `*` as a wildcard character, e.g. `https://*.example.com/oauth.html`. Note that any redirect URI must also be added to the Allowed redirect URIs list in the [developer dashboard](https://dashboard.plaid.com/team/api). If initializing on Android, `android_package_name` must be specified instead and `redirect_uri` should be left blank.
    attr_accessor :redirect_uri

    # The name of your app's Android package. Required if using the `link_token` to initialize Link on Android. Any package name specified here must also be added to the Allowed Android package names setting on the [developer dashboard](https://dashboard.plaid.com/team/api). When creating a `link_token` for initializing Link on other platforms, `android_package_name` must be left blank and `redirect_uri` should be used instead.
    attr_accessor :android_package_name

    attr_accessor :institution_data

    attr_accessor :account_filters

    attr_accessor :eu_config

    # Used for certain Europe-only configurations, as well as certain legacy use cases in other regions.
    attr_accessor :institution_id

    attr_accessor :payment_initiation

    attr_accessor :deposit_switch

    attr_accessor :employment

    attr_accessor :income_verification

    attr_accessor :auth

    attr_accessor :transfer

    attr_accessor :update

    attr_accessor :identity_verification

    # A user token generated using `/user/create`. Any Item created during the Link session will be associated with the user.
    attr_accessor :user_token

    attr_accessor :investments

    attr_accessor :investments_auth

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'client_id' => :'client_id',
        :'secret' => :'secret',
        :'client_name' => :'client_name',
        :'language' => :'language',
        :'country_codes' => :'country_codes',
        :'user' => :'user',
        :'products' => :'products',
        :'additional_consented_products' => :'additional_consented_products',
        :'required_if_supported_products' => :'required_if_supported_products',
        :'webhook' => :'webhook',
        :'access_token' => :'access_token',
        :'link_customization_name' => :'link_customization_name',
        :'redirect_uri' => :'redirect_uri',
        :'android_package_name' => :'android_package_name',
        :'institution_data' => :'institution_data',
        :'account_filters' => :'account_filters',
        :'eu_config' => :'eu_config',
        :'institution_id' => :'institution_id',
        :'payment_initiation' => :'payment_initiation',
        :'deposit_switch' => :'deposit_switch',
        :'employment' => :'employment',
        :'income_verification' => :'income_verification',
        :'auth' => :'auth',
        :'transfer' => :'transfer',
        :'update' => :'update',
        :'identity_verification' => :'identity_verification',
        :'user_token' => :'user_token',
        :'investments' => :'investments',
        :'investments_auth' => :'investments_auth'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'client_id' => :'String',
        :'secret' => :'String',
        :'client_name' => :'String',
        :'language' => :'String',
        :'country_codes' => :'Array<CountryCode>',
        :'user' => :'LinkTokenCreateRequestUser',
        :'products' => :'Array<Products>',
        :'additional_consented_products' => :'Array<Products>',
        :'required_if_supported_products' => :'Array<Products>',
        :'webhook' => :'String',
        :'access_token' => :'String',
        :'link_customization_name' => :'String',
        :'redirect_uri' => :'String',
        :'android_package_name' => :'String',
        :'institution_data' => :'LinkTokenCreateInstitutionData',
        :'account_filters' => :'LinkTokenAccountFilters',
        :'eu_config' => :'LinkTokenEUConfig',
        :'institution_id' => :'String',
        :'payment_initiation' => :'LinkTokenCreateRequestPaymentInitiation',
        :'deposit_switch' => :'LinkTokenCreateRequestDepositSwitch',
        :'employment' => :'LinkTokenCreateRequestEmployment',
        :'income_verification' => :'LinkTokenCreateRequestIncomeVerification',
        :'auth' => :'LinkTokenCreateRequestAuth',
        :'transfer' => :'LinkTokenCreateRequestTransfer',
        :'update' => :'LinkTokenCreateRequestUpdate',
        :'identity_verification' => :'LinkTokenCreateRequestIdentityVerification',
        :'user_token' => :'String',
        :'investments' => :'LinkTokenInvestments',
        :'investments_auth' => :'LinkTokenInvestmentsAuth'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::LinkTokenCreateRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::LinkTokenCreateRequest`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'client_id')
        self.client_id = attributes[:'client_id']
      end

      if attributes.key?(:'secret')
        self.secret = attributes[:'secret']
      end

      if attributes.key?(:'client_name')
        self.client_name = attributes[:'client_name']
      end

      if attributes.key?(:'language')
        self.language = attributes[:'language']
      end

      if attributes.key?(:'country_codes')
        if (value = attributes[:'country_codes']).is_a?(Array)
          self.country_codes = value
        end
      end

      if attributes.key?(:'user')
        self.user = attributes[:'user']
      end

      if attributes.key?(:'products')
        if (value = attributes[:'products']).is_a?(Array)
          self.products = value
        end
      end

      if attributes.key?(:'additional_consented_products')
        if (value = attributes[:'additional_consented_products']).is_a?(Array)
          self.additional_consented_products = value
        end
      end

      if attributes.key?(:'required_if_supported_products')
        if (value = attributes[:'required_if_supported_products']).is_a?(Array)
          self.required_if_supported_products = value
        end
      end

      if attributes.key?(:'webhook')
        self.webhook = attributes[:'webhook']
      end

      if attributes.key?(:'access_token')
        self.access_token = attributes[:'access_token']
      end

      if attributes.key?(:'link_customization_name')
        self.link_customization_name = attributes[:'link_customization_name']
      end

      if attributes.key?(:'redirect_uri')
        self.redirect_uri = attributes[:'redirect_uri']
      end

      if attributes.key?(:'android_package_name')
        self.android_package_name = attributes[:'android_package_name']
      end

      if attributes.key?(:'institution_data')
        self.institution_data = attributes[:'institution_data']
      end

      if attributes.key?(:'account_filters')
        self.account_filters = attributes[:'account_filters']
      end

      if attributes.key?(:'eu_config')
        self.eu_config = attributes[:'eu_config']
      end

      if attributes.key?(:'institution_id')
        self.institution_id = attributes[:'institution_id']
      end

      if attributes.key?(:'payment_initiation')
        self.payment_initiation = attributes[:'payment_initiation']
      end

      if attributes.key?(:'deposit_switch')
        self.deposit_switch = attributes[:'deposit_switch']
      end

      if attributes.key?(:'employment')
        self.employment = attributes[:'employment']
      end

      if attributes.key?(:'income_verification')
        self.income_verification = attributes[:'income_verification']
      end

      if attributes.key?(:'auth')
        self.auth = attributes[:'auth']
      end

      if attributes.key?(:'transfer')
        self.transfer = attributes[:'transfer']
      end

      if attributes.key?(:'update')
        self.update = attributes[:'update']
      end

      if attributes.key?(:'identity_verification')
        self.identity_verification = attributes[:'identity_verification']
      end

      if attributes.key?(:'user_token')
        self.user_token = attributes[:'user_token']
      end

      if attributes.key?(:'investments')
        self.investments = attributes[:'investments']
      end

      if attributes.key?(:'investments_auth')
        self.investments_auth = attributes[:'investments_auth']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @client_name.nil?
        invalid_properties.push('invalid value for "client_name", client_name cannot be nil.')
      end

      if @language.nil?
        invalid_properties.push('invalid value for "language", language cannot be nil.')
      end

      if @country_codes.nil?
        invalid_properties.push('invalid value for "country_codes", country_codes cannot be nil.')
      end


      if @country_codes.length < 1
        invalid_properties.push('invalid value for "country_codes", number of items must be greater than or equal to 1.')
      end

      if @user.nil?
        invalid_properties.push('invalid value for "user", user cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @client_name.nil?
      return false if @language.nil?
      return false if @country_codes.nil?
      return false if @country_codes.length < 1
      return false if @user.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] country_codes Value to be assigned
    def country_codes=(country_codes)
      if country_codes.nil?
        fail ArgumentError, 'country_codes cannot be nil'
      end


      if country_codes.length < 1
        fail ArgumentError, 'invalid value for "country_codes", number of items must be greater than or equal to 1.'
      end

      @country_codes = country_codes
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          client_id == o.client_id &&
          secret == o.secret &&
          client_name == o.client_name &&
          language == o.language &&
          country_codes == o.country_codes &&
          user == o.user &&
          products == o.products &&
          additional_consented_products == o.additional_consented_products &&
          required_if_supported_products == o.required_if_supported_products &&
          webhook == o.webhook &&
          access_token == o.access_token &&
          link_customization_name == o.link_customization_name &&
          redirect_uri == o.redirect_uri &&
          android_package_name == o.android_package_name &&
          institution_data == o.institution_data &&
          account_filters == o.account_filters &&
          eu_config == o.eu_config &&
          institution_id == o.institution_id &&
          payment_initiation == o.payment_initiation &&
          deposit_switch == o.deposit_switch &&
          employment == o.employment &&
          income_verification == o.income_verification &&
          auth == o.auth &&
          transfer == o.transfer &&
          update == o.update &&
          identity_verification == o.identity_verification &&
          user_token == o.user_token &&
          investments == o.investments &&
          investments_auth == o.investments_auth
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [client_id, secret, client_name, language, country_codes, user, products, additional_consented_products, required_if_supported_products, webhook, access_token, link_customization_name, redirect_uri, android_package_name, institution_data, account_filters, eu_config, institution_id, payment_initiation, deposit_switch, employment, income_verification, auth, transfer, update, identity_verification, user_token, investments, investments_auth].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      attributes = attributes.transform_keys(&:to_sym)
      self.class.openapi_types.each_pair do |key, type|
        if attributes[self.class.attribute_map[key]].nil? && self.class.openapi_nullable.include?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = Plaid.const_get(type)
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
