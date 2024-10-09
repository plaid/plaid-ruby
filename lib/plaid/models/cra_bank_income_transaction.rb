=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.575.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  # The transactions data for the end user's income source(s).
  class CraBankIncomeTransaction
    # The unique ID of the transaction. Like all Plaid identifiers, the `transaction_id` is case sensitive.
    attr_accessor :transaction_id

    # The settled value of the transaction, denominated in the transaction's currency as stated in `iso_currency_code` or `unofficial_currency_code`. Positive values when money moves out of the account; negative values when money moves in. For example, credit card purchases are positive; credit card payment, direct deposits, and refunds are negative.
    attr_accessor :amount

    # For pending transactions, the date that the transaction occurred; for posted transactions, the date that the transaction posted. Both dates are returned in an ISO 8601 format (YYYY-MM-DD).
    attr_accessor :date

    # The merchant name or transaction description.
    attr_accessor :name

    # The string returned by the financial institution to describe the transaction.
    attr_accessor :original_description

    # When true, identifies the transaction as pending or unsettled. Pending transaction details (name, type, amount, category ID) may change before they are settled.
    attr_accessor :pending

    # The check number of the transaction. This field is only populated for check transactions.
    attr_accessor :check_number

    # The ISO 4217 currency code of the amount or balance.
    attr_accessor :iso_currency_code

    # The unofficial currency code associated with the amount or balance. Always `null` if `iso_currency_code` is non-null. Unofficial currency codes are used for currencies that do not have official ISO currency codes, such as cryptocurrencies and the currencies of certain countries.
    attr_accessor :unofficial_currency_code

    attr_accessor :bonus_type

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'transaction_id' => :'transaction_id',
        :'amount' => :'amount',
        :'date' => :'date',
        :'name' => :'name',
        :'original_description' => :'original_description',
        :'pending' => :'pending',
        :'check_number' => :'check_number',
        :'iso_currency_code' => :'iso_currency_code',
        :'unofficial_currency_code' => :'unofficial_currency_code',
        :'bonus_type' => :'bonus_type'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'transaction_id' => :'String',
        :'amount' => :'Float',
        :'date' => :'Date',
        :'name' => :'String',
        :'original_description' => :'String',
        :'pending' => :'Boolean',
        :'check_number' => :'String',
        :'iso_currency_code' => :'String',
        :'unofficial_currency_code' => :'String',
        :'bonus_type' => :'CraBankIncomeBonusType'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'original_description',
        :'check_number',
        :'iso_currency_code',
        :'unofficial_currency_code',
        :'bonus_type'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::CraBankIncomeTransaction` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::CraBankIncomeTransaction`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'transaction_id')
        self.transaction_id = attributes[:'transaction_id']
      end

      if attributes.key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.key?(:'date')
        self.date = attributes[:'date']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'original_description')
        self.original_description = attributes[:'original_description']
      end

      if attributes.key?(:'pending')
        self.pending = attributes[:'pending']
      end

      if attributes.key?(:'check_number')
        self.check_number = attributes[:'check_number']
      end

      if attributes.key?(:'iso_currency_code')
        self.iso_currency_code = attributes[:'iso_currency_code']
      end

      if attributes.key?(:'unofficial_currency_code')
        self.unofficial_currency_code = attributes[:'unofficial_currency_code']
      end

      if attributes.key?(:'bonus_type')
        self.bonus_type = attributes[:'bonus_type']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @transaction_id.nil?
        invalid_properties.push('invalid value for "transaction_id", transaction_id cannot be nil.')
      end

      if @amount.nil?
        invalid_properties.push('invalid value for "amount", amount cannot be nil.')
      end

      if @date.nil?
        invalid_properties.push('invalid value for "date", date cannot be nil.')
      end

      if @pending.nil?
        invalid_properties.push('invalid value for "pending", pending cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @transaction_id.nil?
      return false if @amount.nil?
      return false if @date.nil?
      return false if @pending.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          transaction_id == o.transaction_id &&
          amount == o.amount &&
          date == o.date &&
          name == o.name &&
          original_description == o.original_description &&
          pending == o.pending &&
          check_number == o.check_number &&
          iso_currency_code == o.iso_currency_code &&
          unofficial_currency_code == o.unofficial_currency_code &&
          bonus_type == o.bonus_type
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [transaction_id, amount, date, name, original_description, pending, check_number, iso_currency_code, unofficial_currency_code, bonus_type].hash
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
