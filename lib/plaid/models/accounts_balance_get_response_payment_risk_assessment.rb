=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.627.4

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  # Provides a detailed risk assessment for the requested transaction. For this field to be returned, the client must be enrolled in the Balance Plus beta program and the [`payment_details`](http://plaid.com/docs/balance/balance-plus/#accounts-balance-get-request-payment-details) object must have been sent in the request.
  class AccountsBalanceGetResponsePaymentRiskAssessment
    attr_accessor :risk_level

    attr_accessor :attributes

    # A risk score ranging from 1-99, reflecting the likelihood of ACH debit return. A higher score indicates a greater risk of return, often due to overdrawn accounts or account ineligibility to receive ACH transactions. Typical return codes include \"R01\", \"R02\", \"R03\", \"R04\", \"R06\", \"R08\", \"R09\", \"R13\", \"R16\", \"R17\", \"R20\", \"R23\", etc., with a turnaround of 2 banking days.
    attr_accessor :score

    # Timestamp of the last successful balance update, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format.
    attr_accessor :balance_last_updated

    # An array of objects, each representing a specific reason contributing to the risk assessment of an ACH transaction. This field is only supplied for transactions classified as `HIGH`, `MEDIUM-HIGH`, or `MEDIUM` risk.
    attr_accessor :risk_reasons

    # Whether the proposed transaction exceeds the balance threshold set in the request. `true` indicates higher risk; `false` indicates lower risk. If the `amount` multiplied by the `balance_threshold_percentage` (as a percentage) exceeds the balance in the account, then `exceeds_balance_threshold` will be true, otherwise, it will be false. For example, if the `amount` is 200 and the `balance_threshold_percentage` is 90, then the account balance must be at least 180 for `exceeds_balance_threshold` to be false.  By default, the available balance will be used for this calculation; if it cannot be obtained, the current balance will be used.  This field is particularly useful for customers using indirect Items and who do not have direct access to raw balance data.
    attr_accessor :exceeds_balance_threshold

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
        :'risk_level' => :'risk_level',
        :'attributes' => :'attributes',
        :'score' => :'score',
        :'balance_last_updated' => :'balance_last_updated',
        :'risk_reasons' => :'risk_reasons',
        :'exceeds_balance_threshold' => :'exceeds_balance_threshold'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'risk_level' => :'BalancePlusRiskLevel',
        :'attributes' => :'BalancePlusAttributes',
        :'score' => :'Integer',
        :'balance_last_updated' => :'Time',
        :'risk_reasons' => :'Array<RiskReason>',
        :'exceeds_balance_threshold' => :'Boolean'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'score',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::AccountsBalanceGetResponsePaymentRiskAssessment` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::AccountsBalanceGetResponsePaymentRiskAssessment`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'risk_level')
        self.risk_level = attributes[:'risk_level']
      end

      if attributes.key?(:'attributes')
        self.attributes = attributes[:'attributes']
      end

      if attributes.key?(:'score')
        self.score = attributes[:'score']
      end

      if attributes.key?(:'balance_last_updated')
        self.balance_last_updated = attributes[:'balance_last_updated']
      end

      if attributes.key?(:'risk_reasons')
        if (value = attributes[:'risk_reasons']).is_a?(Array)
          self.risk_reasons = value
        end
      end

      if attributes.key?(:'exceeds_balance_threshold')
        self.exceeds_balance_threshold = attributes[:'exceeds_balance_threshold']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @risk_level.nil?
        invalid_properties.push('invalid value for "risk_level", risk_level cannot be nil.')
      end

      if @attributes.nil?
        invalid_properties.push('invalid value for "attributes", attributes cannot be nil.')
      end

      if !@score.nil? && @score > 99
        invalid_properties.push('invalid value for "score", must be smaller than or equal to 99.')
      end

      if !@score.nil? && @score < 1
        invalid_properties.push('invalid value for "score", must be greater than or equal to 1.')
      end


      if @balance_last_updated.nil?
        invalid_properties.push('invalid value for "balance_last_updated", balance_last_updated cannot be nil.')
      end

      if @exceeds_balance_threshold.nil?
        invalid_properties.push('invalid value for "exceeds_balance_threshold", exceeds_balance_threshold cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @risk_level.nil?
      return false if @attributes.nil?
      return false if !@score.nil? && @score > 99
      return false if !@score.nil? && @score < 1
      return false if @balance_last_updated.nil?
      return false if @exceeds_balance_threshold.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] score Value to be assigned
    def score=(score)
      if !score.nil? && score > 99
        fail ArgumentError, 'invalid value for "score", must be smaller than or equal to 99.'
      end

      if !score.nil? && score < 1
        fail ArgumentError, 'invalid value for "score", must be greater than or equal to 1.'
      end


      @score = score
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          risk_level == o.risk_level &&
          attributes == o.attributes &&
          score == o.score &&
          balance_last_updated == o.balance_last_updated &&
          risk_reasons == o.risk_reasons &&
          exceeds_balance_threshold == o.exceeds_balance_threshold
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [risk_level, attributes, score, balance_last_updated, risk_reasons, exceeds_balance_threshold].hash
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
