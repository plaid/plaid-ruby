=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.610.2

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  # This object includes the scores and risk level. This response is offered as an add-on to /transfer/authorization/create. To request access to these fields please contact your Plaid account manager.
  class TransferAuthorizationPaymentRisk
    # A score from 1-99 that indicates the transaction return risk: a higher risk score suggests a higher return likelihood.  The score evaluates the transaction return risk because an account is overdrawn or because an ineligible account is used and covers return codes: \"R01\", \"R02\", \"R03\", \"R04\", \"R06\", \"R08\",  \"R09\", \"R13\", \"R16\", \"R17\", \"R20\", \"R23\". These returns have a turnaround time of 2 banking days.
    attr_accessor :bank_initiated_return_score

    # A score from 1-99 that indicates the transaction return risk: a higher risk score suggests a higher return likelihood.  The score evaluates the transaction return risk of an unauthorized debit and covers return codes: \"R05\", \"R07\", \"R10\", \"R11\", \"R29\". These returns typically have a return time frame of up to 60 calendar days. During this period, the customer of financial institutions can dispute a transaction as unauthorized.
    attr_accessor :customer_initiated_return_score

    attr_accessor :risk_level

    # If bank information was not available to be used in the Signal model, this array contains warnings describing why bank data is missing. If you want to receive an API error instead of Signal scores in the case of missing bank data, file a support ticket or contact your Plaid account manager.
    attr_accessor :warnings

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
        :'bank_initiated_return_score' => :'bank_initiated_return_score',
        :'customer_initiated_return_score' => :'customer_initiated_return_score',
        :'risk_level' => :'risk_level',
        :'warnings' => :'warnings'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'bank_initiated_return_score' => :'Integer',
        :'customer_initiated_return_score' => :'Integer',
        :'risk_level' => :'TransferAuthorizationRiskLevel',
        :'warnings' => :'Array<SignalWarning>'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'bank_initiated_return_score',
        :'customer_initiated_return_score',
        :'risk_level',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::TransferAuthorizationPaymentRisk` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::TransferAuthorizationPaymentRisk`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'bank_initiated_return_score')
        self.bank_initiated_return_score = attributes[:'bank_initiated_return_score']
      end

      if attributes.key?(:'customer_initiated_return_score')
        self.customer_initiated_return_score = attributes[:'customer_initiated_return_score']
      end

      if attributes.key?(:'risk_level')
        self.risk_level = attributes[:'risk_level']
      end

      if attributes.key?(:'warnings')
        if (value = attributes[:'warnings']).is_a?(Array)
          self.warnings = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @bank_initiated_return_score > 99
        invalid_properties.push('invalid value for "bank_initiated_return_score", must be smaller than or equal to 99.')
      end

      if @bank_initiated_return_score < 1
        invalid_properties.push('invalid value for "bank_initiated_return_score", must be greater than or equal to 1.')
      end


      if @customer_initiated_return_score > 99
        invalid_properties.push('invalid value for "customer_initiated_return_score", must be smaller than or equal to 99.')
      end

      if @customer_initiated_return_score < 1
        invalid_properties.push('invalid value for "customer_initiated_return_score", must be greater than or equal to 1.')
      end


      if @warnings.nil?
        invalid_properties.push('invalid value for "warnings", warnings cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @bank_initiated_return_score > 99
      return false if @bank_initiated_return_score < 1
      return false if @customer_initiated_return_score > 99
      return false if @customer_initiated_return_score < 1
      return false if @warnings.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] bank_initiated_return_score Value to be assigned
    def bank_initiated_return_score=(bank_initiated_return_score)
      if bank_initiated_return_score > 99
        fail ArgumentError, 'invalid value for "bank_initiated_return_score", must be smaller than or equal to 99.'
      end

      if bank_initiated_return_score < 1
        fail ArgumentError, 'invalid value for "bank_initiated_return_score", must be greater than or equal to 1.'
      end


      @bank_initiated_return_score = bank_initiated_return_score
    end

    # Custom attribute writer method with validation
    # @param [Object] customer_initiated_return_score Value to be assigned
    def customer_initiated_return_score=(customer_initiated_return_score)
      if customer_initiated_return_score > 99
        fail ArgumentError, 'invalid value for "customer_initiated_return_score", must be smaller than or equal to 99.'
      end

      if customer_initiated_return_score < 1
        fail ArgumentError, 'invalid value for "customer_initiated_return_score", must be greater than or equal to 1.'
      end


      @customer_initiated_return_score = customer_initiated_return_score
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          bank_initiated_return_score == o.bank_initiated_return_score &&
          customer_initiated_return_score == o.customer_initiated_return_score &&
          risk_level == o.risk_level &&
          warnings == o.warnings
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [bank_initiated_return_score, customer_initiated_return_score, risk_level, warnings].hash
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
