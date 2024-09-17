=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.565.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  # To enable Balance Plus (beta), send this object as part of the `/accounts/balance/get` request. Only available to customers participating in the Balance Plus beta program; to enroll in the beta, contact your account manager. If this object is present in the request, the [`payment_risk_assessment`](https://plaid.com/docs/balance/balance-plus/#accounts-balance-get-response-payment-risk-assessment-risk-level) object will be present in the response.
  class AccountsBalanceGetRequestPaymentDetails
    # The Plaid `account_id` of the account that is the funding source for the proposed transaction. The `account_id` is returned in the `/accounts/get` endpoint as well as the [`onSuccess`](/docs/link/ios/#link-ios-onsuccess-linkSuccess-metadata-accounts-id) callback metadata.  This will return an [`INVALID_ACCOUNT_ID`](/docs/errors/invalid-input/#invalid_account_id) error if the account has been removed at the bank or if the `account_id` is no longer valid.
    attr_accessor :account_id

    # The unique ID that you would like to use to refer to this transaction. For your convenience mapping your internal data, you could use your internal identifier for this transaction.
    attr_accessor :client_transaction_id

    # The transaction amount, in USD (e.g. `102.05`)
    attr_accessor :amount

    # If the `amount` multiplied by the `balance_threshold_percentage` (as a percentage) exceeds the balance in the account, then [`payment_risk_assessment.exceeds_balance_threshold`](https://plaid.com/docs/balance/balance-plus/#accounts-balance-get-response-payment-risk-assessment-exceeds-balance-threshold) in the response will be true, otherwise, it will be false. For example, if the `amount` is 200 and the `balance_threshold_percentage` is 90, then the account balance must be at least 180 for `exceeds_balance_threshold` to be false.   By default, the available balance will be used for this calculation; if it cannot be obtained, the current balance will be used.   This field is particularly useful for customers using indirect Items and who do not have direct access to raw balance data.
    attr_accessor :balance_threshold_percentage

    # A boolean that determines whether the balance has to be refreshed in real time as part of the API call when using Balance Plus. Setting this to field to `true` will result in more recent balances, but latency may be up to 30 seconds or more. If making a regular (non-Balance Plus) Balance call, without the `payment_details` object present, `/accounts/balance/get` will always return real-time balances.
    attr_accessor :requires_real_time_balance_refresh

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'account_id' => :'account_id',
        :'client_transaction_id' => :'client_transaction_id',
        :'amount' => :'amount',
        :'balance_threshold_percentage' => :'balance_threshold_percentage',
        :'requires_real_time_balance_refresh' => :'requires_real_time_balance_refresh'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'account_id' => :'String',
        :'client_transaction_id' => :'String',
        :'amount' => :'Float',
        :'balance_threshold_percentage' => :'Integer',
        :'requires_real_time_balance_refresh' => :'Boolean'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::AccountsBalanceGetRequestPaymentDetails` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::AccountsBalanceGetRequestPaymentDetails`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'account_id')
        self.account_id = attributes[:'account_id']
      end

      if attributes.key?(:'client_transaction_id')
        self.client_transaction_id = attributes[:'client_transaction_id']
      end

      if attributes.key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.key?(:'balance_threshold_percentage')
        self.balance_threshold_percentage = attributes[:'balance_threshold_percentage']
      else
        self.balance_threshold_percentage = 90
      end

      if attributes.key?(:'requires_real_time_balance_refresh')
        self.requires_real_time_balance_refresh = attributes[:'requires_real_time_balance_refresh']
      else
        self.requires_real_time_balance_refresh = false
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @account_id.nil?
        invalid_properties.push('invalid value for "account_id", account_id cannot be nil.')
      end

      if @client_transaction_id.nil?
        invalid_properties.push('invalid value for "client_transaction_id", client_transaction_id cannot be nil.')
      end

      if @client_transaction_id.to_s.length > 36
        invalid_properties.push('invalid value for "client_transaction_id", the character length must be smaller than or equal to 36.')
      end

      if @client_transaction_id.to_s.length < 1
        invalid_properties.push('invalid value for "client_transaction_id", the character length must be great than or equal to 1.')
      end


      if @amount.nil?
        invalid_properties.push('invalid value for "amount", amount cannot be nil.')
      end

      if !@balance_threshold_percentage.nil? && @balance_threshold_percentage < 1
        invalid_properties.push('invalid value for "balance_threshold_percentage", must be greater than or equal to 1.')
      end


      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @account_id.nil?
      return false if @client_transaction_id.nil?
      return false if @client_transaction_id.to_s.length > 36
      return false if @client_transaction_id.to_s.length < 1
      return false if @amount.nil?
      return false if !@balance_threshold_percentage.nil? && @balance_threshold_percentage < 1
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] client_transaction_id Value to be assigned
    def client_transaction_id=(client_transaction_id)
      if client_transaction_id.nil?
        fail ArgumentError, 'client_transaction_id cannot be nil'
      end

      if client_transaction_id.to_s.length > 36
        fail ArgumentError, 'invalid value for "client_transaction_id", the character length must be smaller than or equal to 36.'
      end

      if client_transaction_id.to_s.length < 1
        fail ArgumentError, 'invalid value for "client_transaction_id", the character length must be great than or equal to 1.'
      end


      @client_transaction_id = client_transaction_id
    end

    # Custom attribute writer method with validation
    # @param [Object] balance_threshold_percentage Value to be assigned
    def balance_threshold_percentage=(balance_threshold_percentage)
      if !balance_threshold_percentage.nil? && balance_threshold_percentage < 1
        fail ArgumentError, 'invalid value for "balance_threshold_percentage", must be greater than or equal to 1.'
      end


      @balance_threshold_percentage = balance_threshold_percentage
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          account_id == o.account_id &&
          client_transaction_id == o.client_transaction_id &&
          amount == o.amount &&
          balance_threshold_percentage == o.balance_threshold_percentage &&
          requires_real_time_balance_refresh == o.requires_real_time_balance_refresh
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [account_id, client_transaction_id, amount, balance_threshold_percentage, requires_real_time_balance_refresh].hash
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
