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
  # WalletTransactionListRequest defines the request schema for `/wallet/transaction/list`
  class WalletTransactionsListRequest
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    attr_accessor :client_id

    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    attr_accessor :secret

    # The ID of the e-wallet to fetch transactions from
    attr_accessor :wallet_id

    # A base64 value representing the latest transaction that has already been requested. Set this to `next_cursor` received from the previous `/wallet/transaction/list` request. If provided, the response will only contain transactions created before that transaction. If omitted, the response will contain transactions starting from the most recent, and in descending order by the `created_at` time.
    attr_accessor :cursor

    # The number of transactions to fetch
    attr_accessor :count

    attr_accessor :options

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'client_id' => :'client_id',
        :'secret' => :'secret',
        :'wallet_id' => :'wallet_id',
        :'cursor' => :'cursor',
        :'count' => :'count',
        :'options' => :'options'
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
        :'wallet_id' => :'String',
        :'cursor' => :'String',
        :'count' => :'Integer',
        :'options' => :'WalletTransactionListRequestOptions'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'options'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::WalletTransactionsListRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::WalletTransactionsListRequest`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'client_id')
        self.client_id = attributes[:'client_id']
      end

      if attributes.key?(:'secret')
        self.secret = attributes[:'secret']
      end

      if attributes.key?(:'wallet_id')
        self.wallet_id = attributes[:'wallet_id']
      end

      if attributes.key?(:'cursor')
        self.cursor = attributes[:'cursor']
      end

      if attributes.key?(:'count')
        self.count = attributes[:'count']
      else
        self.count = 10
      end

      if attributes.key?(:'options')
        self.options = attributes[:'options']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @wallet_id.nil?
        invalid_properties.push('invalid value for "wallet_id", wallet_id cannot be nil.')
      end

      if @wallet_id.to_s.length < 1
        invalid_properties.push('invalid value for "wallet_id", the character length must be great than or equal to 1.')
      end


      if !@cursor.nil? && @cursor.to_s.length > 256
        invalid_properties.push('invalid value for "cursor", the character length must be smaller than or equal to 256.')
      end


      if !@count.nil? && @count > 200
        invalid_properties.push('invalid value for "count", must be smaller than or equal to 200.')
      end

      if !@count.nil? && @count < 1
        invalid_properties.push('invalid value for "count", must be greater than or equal to 1.')
      end


      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @wallet_id.nil?
      return false if @wallet_id.to_s.length < 1
      return false if !@cursor.nil? && @cursor.to_s.length > 256
      return false if !@count.nil? && @count > 200
      return false if !@count.nil? && @count < 1
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] wallet_id Value to be assigned
    def wallet_id=(wallet_id)
      if wallet_id.nil?
        fail ArgumentError, 'wallet_id cannot be nil'
      end

      if wallet_id.to_s.length < 1
        fail ArgumentError, 'invalid value for "wallet_id", the character length must be great than or equal to 1.'
      end


      @wallet_id = wallet_id
    end

    # Custom attribute writer method with validation
    # @param [Object] cursor Value to be assigned
    def cursor=(cursor)
      if !cursor.nil? && cursor.to_s.length > 256
        fail ArgumentError, 'invalid value for "cursor", the character length must be smaller than or equal to 256.'
      end


      @cursor = cursor
    end

    # Custom attribute writer method with validation
    # @param [Object] count Value to be assigned
    def count=(count)
      if !count.nil? && count > 200
        fail ArgumentError, 'invalid value for "count", must be smaller than or equal to 200.'
      end

      if !count.nil? && count < 1
        fail ArgumentError, 'invalid value for "count", must be greater than or equal to 1.'
      end


      @count = count
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          client_id == o.client_id &&
          secret == o.secret &&
          wallet_id == o.wallet_id &&
          cursor == o.cursor &&
          count == o.count &&
          options == o.options
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [client_id, secret, wallet_id, cursor, count, options].hash
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
