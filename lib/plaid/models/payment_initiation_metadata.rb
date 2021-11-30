=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.54.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.1.0

=end

require 'date'
require 'time'

module Plaid
  # Metadata that captures what specific payment configurations an institution supports when making Payment Initiation requests.
  class PaymentInitiationMetadata
    # Indicates whether the institution supports payments from a different country.
    attr_accessor :supports_international_payments

    # A mapping of currency to maximum payment amount (denominated in the smallest unit of currency) supported by the insitution.  Example: `{\"GBP\": \"10000\"}` 
    attr_accessor :maximum_payment_amount

    # Indicates whether the institution supports returning refund details when initiating a payment.
    attr_accessor :supports_refund_details

    attr_accessor :standing_order_metadata

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'supports_international_payments' => :'supports_international_payments',
        :'maximum_payment_amount' => :'maximum_payment_amount',
        :'supports_refund_details' => :'supports_refund_details',
        :'standing_order_metadata' => :'standing_order_metadata'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'supports_international_payments' => :'Boolean',
        :'maximum_payment_amount' => :'Hash<String, String>',
        :'supports_refund_details' => :'Boolean',
        :'standing_order_metadata' => :'PaymentInitiationStandingOrderMetadata'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'standing_order_metadata'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::PaymentInitiationMetadata` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::PaymentInitiationMetadata`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'supports_international_payments')
        self.supports_international_payments = attributes[:'supports_international_payments']
      end

      if attributes.key?(:'maximum_payment_amount')
        if (value = attributes[:'maximum_payment_amount']).is_a?(Hash)
          self.maximum_payment_amount = value
        end
      end

      if attributes.key?(:'supports_refund_details')
        self.supports_refund_details = attributes[:'supports_refund_details']
      end

      if attributes.key?(:'standing_order_metadata')
        self.standing_order_metadata = attributes[:'standing_order_metadata']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @supports_international_payments.nil?
        invalid_properties.push('invalid value for "supports_international_payments", supports_international_payments cannot be nil.')
      end

      if @maximum_payment_amount.nil?
        invalid_properties.push('invalid value for "maximum_payment_amount", maximum_payment_amount cannot be nil.')
      end

      if @supports_refund_details.nil?
        invalid_properties.push('invalid value for "supports_refund_details", supports_refund_details cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @supports_international_payments.nil?
      return false if @maximum_payment_amount.nil?
      return false if @supports_refund_details.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          supports_international_payments == o.supports_international_payments &&
          maximum_payment_amount == o.maximum_payment_amount &&
          supports_refund_details == o.supports_refund_details &&
          standing_order_metadata == o.standing_order_metadata
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [supports_international_payments, maximum_payment_amount, supports_refund_details, standing_order_metadata].hash
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
