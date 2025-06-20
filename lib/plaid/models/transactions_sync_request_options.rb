=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.645.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  # An optional object to be used with the request. If specified, `options` must not be `null`.
  class TransactionsSyncRequestOptions
    # Include the raw unparsed transaction description from the financial institution.
    attr_accessor :include_original_description

    # Personal finance categories are now returned by default.
    attr_accessor :include_personal_finance_category

    # Counterparties and extra merchant fields are now returned by default.
    attr_accessor :include_logo_and_counterparty_beta

    # This field only applies to calls for Items where the Transactions product has not already been initialized (i.e., by specifying `transactions` in the `products`, `required_if_supported_products`, or `optional_products` array when calling `/link/token/create` or by making a previous call to `/transactions/sync` or `/transactions/get`). In those cases, the field controls the maximum number of days of transaction history that Plaid will request from the financial institution. The more transaction history is requested, the longer the historical update poll will take. If no value is specified, 90 days of history will be requested by default.  If you are initializing your Items with transactions during the `/link/token/create` call (e.g. by including `transactions` in the `/link/token/create` `products` array), you must use the [`transactions.days_requested`](https://plaid.com/docs/api/link/#link-token-create-request-transactions-days-requested) field in the `/link/token/create` request instead of in the `/transactions/sync` request.  If the Item has already been initialized with the Transactions product, this field will have no effect. The maximum amount of transaction history to request on an Item cannot be updated if Transactions has already been added to the Item. To request older transaction history on an Item where Transactions has already been added, you must delete the Item via `/item/remove` and send the user through Link to create a new Item.  Customers using [Recurring Transactions](https://plaid.com/docs/api/products/transactions/#transactionsrecurringget) should request at least 180 days of history for optimal results.
    attr_accessor :days_requested

    # If provided, the returned updates and cursor will only reflect the specified account's transactions. Omitting `account_id` returns updates for all accounts under the Item. Note that specifying an `account_id` effectively creates a separate incremental update stream—and therefore a separate cursor—for that account. If multiple accounts are queried this way, you will maintain multiple cursors, one per `account_id`.  If you decide to begin filtering by `account_id` after using no `account_id`, start fresh with a null cursor and maintain separate `(account_id, cursor)` pairs going forward. Do not reuse any previously saved cursors, as this can cause pagination errors or incomplete data.  Note: An error will be returned if a provided `account_id` is not associated with the Item.
    attr_accessor :account_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'include_original_description' => :'include_original_description',
        :'include_personal_finance_category' => :'include_personal_finance_category',
        :'include_logo_and_counterparty_beta' => :'include_logo_and_counterparty_beta',
        :'days_requested' => :'days_requested',
        :'account_id' => :'account_id'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'include_original_description' => :'Boolean',
        :'include_personal_finance_category' => :'Boolean',
        :'include_logo_and_counterparty_beta' => :'Boolean',
        :'days_requested' => :'Integer',
        :'account_id' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'include_original_description',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::TransactionsSyncRequestOptions` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::TransactionsSyncRequestOptions`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'include_original_description')
        self.include_original_description = attributes[:'include_original_description']
      else
        self.include_original_description = false
      end

      if attributes.key?(:'include_personal_finance_category')
        self.include_personal_finance_category = attributes[:'include_personal_finance_category']
      else
        self.include_personal_finance_category = false
      end

      if attributes.key?(:'include_logo_and_counterparty_beta')
        self.include_logo_and_counterparty_beta = attributes[:'include_logo_and_counterparty_beta']
      else
        self.include_logo_and_counterparty_beta = false
      end

      if attributes.key?(:'days_requested')
        self.days_requested = attributes[:'days_requested']
      else
        self.days_requested = 90
      end

      if attributes.key?(:'account_id')
        self.account_id = attributes[:'account_id']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@days_requested.nil? && @days_requested > 730
        invalid_properties.push('invalid value for "days_requested", must be smaller than or equal to 730.')
      end

      if !@days_requested.nil? && @days_requested < 1
        invalid_properties.push('invalid value for "days_requested", must be greater than or equal to 1.')
      end


      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@days_requested.nil? && @days_requested > 730
      return false if !@days_requested.nil? && @days_requested < 1
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] days_requested Value to be assigned
    def days_requested=(days_requested)
      if !days_requested.nil? && days_requested > 730
        fail ArgumentError, 'invalid value for "days_requested", must be smaller than or equal to 730.'
      end

      if !days_requested.nil? && days_requested < 1
        fail ArgumentError, 'invalid value for "days_requested", must be greater than or equal to 1.'
      end


      @days_requested = days_requested
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          include_original_description == o.include_original_description &&
          include_personal_finance_category == o.include_personal_finance_category &&
          include_logo_and_counterparty_beta == o.include_logo_and_counterparty_beta &&
          days_requested == o.days_requested &&
          account_id == o.account_id
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [include_original_description, include_personal_finance_category, include_logo_and_counterparty_beta, days_requested, account_id].hash
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
