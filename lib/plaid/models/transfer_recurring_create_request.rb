=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.370.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.1.1

=end

require 'date'
require 'time'

module Plaid
  # Defines the request schema for `/transfer/recurring/create`
  class TransferRecurringCreateRequest
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    attr_accessor :client_id

    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    attr_accessor :secret

    # The Plaid `access_token` for the account that will be debited or credited. Required if not using `payment_profile_token`.
    attr_accessor :access_token

    # A random key provided by the client, per unique recurring transfer. Maximum of 50 characters.  The API supports idempotency for safely retrying requests without accidentally performing the same operation twice. For example, if a request to create a recurring fails due to a network connection error, you can retry the request with the same idempotency key to guarantee that only a single recurring transfer is created.
    attr_accessor :idempotency_key

    # The Plaid `account_id` corresponding to the end-user account that will be debited or credited. Returned only if `account_id` was set on intent creation.
    attr_accessor :account_id

    # The id of the funding account to use, available in the Plaid Dashboard. This determines which of your business checking accounts will be credited or debited. Defaults to the account configured during onboarding.
    attr_accessor :funding_account_id

    attr_accessor :type

    attr_accessor :network

    attr_accessor :ach_class

    # The amount of the transfer (decimal string with two digits of precision e.g. \"10.00\").
    attr_accessor :amount

    # If the end user is initiating the specific transfer themselves via an interactive UI, this should be `true`; for automatic recurring payments where the end user is not actually initiating each individual transfer, it should be `false`.
    attr_accessor :user_present

    # The currency of the transfer amount. The default value is \"USD\".
    attr_accessor :iso_currency_code

    # The description of the recurring transfer.
    attr_accessor :description

    # Plaid’s unique identifier for a test clock.
    attr_accessor :test_clock_id

    attr_accessor :schedule

    attr_accessor :user

    attr_accessor :device

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'client_id' => :'client_id',
        :'secret' => :'secret',
        :'access_token' => :'access_token',
        :'idempotency_key' => :'idempotency_key',
        :'account_id' => :'account_id',
        :'funding_account_id' => :'funding_account_id',
        :'type' => :'type',
        :'network' => :'network',
        :'ach_class' => :'ach_class',
        :'amount' => :'amount',
        :'user_present' => :'user_present',
        :'iso_currency_code' => :'iso_currency_code',
        :'description' => :'description',
        :'test_clock_id' => :'test_clock_id',
        :'schedule' => :'schedule',
        :'user' => :'user',
        :'device' => :'device'
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
        :'access_token' => :'String',
        :'idempotency_key' => :'String',
        :'account_id' => :'String',
        :'funding_account_id' => :'String',
        :'type' => :'TransferType',
        :'network' => :'TransferNetwork',
        :'ach_class' => :'ACHClass',
        :'amount' => :'String',
        :'user_present' => :'Boolean',
        :'iso_currency_code' => :'String',
        :'description' => :'String',
        :'test_clock_id' => :'String',
        :'schedule' => :'TransferRecurringSchedule',
        :'user' => :'TransferUserInRequest',
        :'device' => :'TransferDevice'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'funding_account_id',
        :'user_present',
        :'test_clock_id',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::TransferRecurringCreateRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::TransferRecurringCreateRequest`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'client_id')
        self.client_id = attributes[:'client_id']
      end

      if attributes.key?(:'secret')
        self.secret = attributes[:'secret']
      end

      if attributes.key?(:'access_token')
        self.access_token = attributes[:'access_token']
      end

      if attributes.key?(:'idempotency_key')
        self.idempotency_key = attributes[:'idempotency_key']
      end

      if attributes.key?(:'account_id')
        self.account_id = attributes[:'account_id']
      end

      if attributes.key?(:'funding_account_id')
        self.funding_account_id = attributes[:'funding_account_id']
      end

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.key?(:'network')
        self.network = attributes[:'network']
      end

      if attributes.key?(:'ach_class')
        self.ach_class = attributes[:'ach_class']
      end

      if attributes.key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.key?(:'user_present')
        self.user_present = attributes[:'user_present']
      end

      if attributes.key?(:'iso_currency_code')
        self.iso_currency_code = attributes[:'iso_currency_code']
      end

      if attributes.key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.key?(:'test_clock_id')
        self.test_clock_id = attributes[:'test_clock_id']
      end

      if attributes.key?(:'schedule')
        self.schedule = attributes[:'schedule']
      end

      if attributes.key?(:'user')
        self.user = attributes[:'user']
      end

      if attributes.key?(:'device')
        self.device = attributes[:'device']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @access_token.nil?
        invalid_properties.push('invalid value for "access_token", access_token cannot be nil.')
      end

      if @idempotency_key.nil?
        invalid_properties.push('invalid value for "idempotency_key", idempotency_key cannot be nil.')
      end

      if @idempotency_key.to_s.length > 50
        invalid_properties.push('invalid value for "idempotency_key", the character length must be smaller than or equal to 50.')
      end


      if @account_id.nil?
        invalid_properties.push('invalid value for "account_id", account_id cannot be nil.')
      end

      if @type.nil?
        invalid_properties.push('invalid value for "type", type cannot be nil.')
      end

      if @network.nil?
        invalid_properties.push('invalid value for "network", network cannot be nil.')
      end

      if @amount.nil?
        invalid_properties.push('invalid value for "amount", amount cannot be nil.')
      end

      if @description.nil?
        invalid_properties.push('invalid value for "description", description cannot be nil.')
      end

      if @schedule.nil?
        invalid_properties.push('invalid value for "schedule", schedule cannot be nil.')
      end

      if @user.nil?
        invalid_properties.push('invalid value for "user", user cannot be nil.')
      end

      if @device.nil?
        invalid_properties.push('invalid value for "device", device cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @access_token.nil?
      return false if @idempotency_key.nil?
      return false if @idempotency_key.to_s.length > 50
      return false if @account_id.nil?
      return false if @type.nil?
      return false if @network.nil?
      return false if @amount.nil?
      return false if @description.nil?
      return false if @schedule.nil?
      return false if @user.nil?
      return false if @device.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] idempotency_key Value to be assigned
    def idempotency_key=(idempotency_key)
      if idempotency_key.nil?
        fail ArgumentError, 'idempotency_key cannot be nil'
      end

      if idempotency_key.to_s.length > 50
        fail ArgumentError, 'invalid value for "idempotency_key", the character length must be smaller than or equal to 50.'
      end


      @idempotency_key = idempotency_key
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          client_id == o.client_id &&
          secret == o.secret &&
          access_token == o.access_token &&
          idempotency_key == o.idempotency_key &&
          account_id == o.account_id &&
          funding_account_id == o.funding_account_id &&
          type == o.type &&
          network == o.network &&
          ach_class == o.ach_class &&
          amount == o.amount &&
          user_present == o.user_present &&
          iso_currency_code == o.iso_currency_code &&
          description == o.description &&
          test_clock_id == o.test_clock_id &&
          schedule == o.schedule &&
          user == o.user &&
          device == o.device
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [client_id, secret, access_token, idempotency_key, account_id, funding_account_id, type, network, ach_class, amount, user_present, iso_currency_code, description, test_clock_id, schedule, user, device].hash
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
