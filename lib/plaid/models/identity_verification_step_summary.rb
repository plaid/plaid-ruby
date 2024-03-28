=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.503.5

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  # Each step will be one of the following values:   `active` - This step is the user's current step. They are either in the process of completing this step, or they recently closed their Identity Verification attempt while in the middle of this step. Only one step will be marked as `active` at any given point.  `success` - The Identity Verification attempt has completed this step.  `failed` - The user failed this step. This can either call the user to fail the session as a whole, or cause them to fallback to another step depending on how the Identity Verification template is configured. A failed step does not imply a failed session.  `waiting_for_prerequisite` - The user needs to complete another step first, before they progress to this step. This step may never run, depending on if the user fails an earlier step or if the step is only run as a fallback.  `not_applicable` - This step will not be run for this session.  `skipped` - The retry instructions that created this Identity Verification attempt specified that this step should be skipped.  `expired` - This step had not yet been completed when the Identity Verification attempt as a whole expired.  `canceled` - The Identity Verification attempt was canceled before the user completed this step.  `pending_review` - The Identity Verification attempt template was configured to perform a screening that had one or more hits needing review.  `manually_approved` - The step was manually overridden to pass by a team member in the dashboard.  `manually_rejected` - The step was manually overridden to fail by a team member in the dashboard.
  class IdentityVerificationStepSummary
    attr_accessor :accept_tos

    attr_accessor :verify_sms

    attr_accessor :kyc_check

    attr_accessor :documentary_verification

    attr_accessor :selfie_check

    attr_accessor :watchlist_screening

    attr_accessor :risk_check

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
        :'accept_tos' => :'accept_tos',
        :'verify_sms' => :'verify_sms',
        :'kyc_check' => :'kyc_check',
        :'documentary_verification' => :'documentary_verification',
        :'selfie_check' => :'selfie_check',
        :'watchlist_screening' => :'watchlist_screening',
        :'risk_check' => :'risk_check'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'accept_tos' => :'IdentityVerificationStepStatus',
        :'verify_sms' => :'IdentityVerificationStepStatus',
        :'kyc_check' => :'IdentityVerificationStepStatus',
        :'documentary_verification' => :'IdentityVerificationStepStatus',
        :'selfie_check' => :'IdentityVerificationStepStatus',
        :'watchlist_screening' => :'IdentityVerificationStepStatus',
        :'risk_check' => :'IdentityVerificationStepStatus'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::IdentityVerificationStepSummary` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::IdentityVerificationStepSummary`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'accept_tos')
        self.accept_tos = attributes[:'accept_tos']
      end

      if attributes.key?(:'verify_sms')
        self.verify_sms = attributes[:'verify_sms']
      end

      if attributes.key?(:'kyc_check')
        self.kyc_check = attributes[:'kyc_check']
      end

      if attributes.key?(:'documentary_verification')
        self.documentary_verification = attributes[:'documentary_verification']
      end

      if attributes.key?(:'selfie_check')
        self.selfie_check = attributes[:'selfie_check']
      end

      if attributes.key?(:'watchlist_screening')
        self.watchlist_screening = attributes[:'watchlist_screening']
      end

      if attributes.key?(:'risk_check')
        self.risk_check = attributes[:'risk_check']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @accept_tos.nil?
        invalid_properties.push('invalid value for "accept_tos", accept_tos cannot be nil.')
      end

      if @verify_sms.nil?
        invalid_properties.push('invalid value for "verify_sms", verify_sms cannot be nil.')
      end

      if @kyc_check.nil?
        invalid_properties.push('invalid value for "kyc_check", kyc_check cannot be nil.')
      end

      if @documentary_verification.nil?
        invalid_properties.push('invalid value for "documentary_verification", documentary_verification cannot be nil.')
      end

      if @selfie_check.nil?
        invalid_properties.push('invalid value for "selfie_check", selfie_check cannot be nil.')
      end

      if @watchlist_screening.nil?
        invalid_properties.push('invalid value for "watchlist_screening", watchlist_screening cannot be nil.')
      end

      if @risk_check.nil?
        invalid_properties.push('invalid value for "risk_check", risk_check cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @accept_tos.nil?
      return false if @verify_sms.nil?
      return false if @kyc_check.nil?
      return false if @documentary_verification.nil?
      return false if @selfie_check.nil?
      return false if @watchlist_screening.nil?
      return false if @risk_check.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          accept_tos == o.accept_tos &&
          verify_sms == o.verify_sms &&
          kyc_check == o.kyc_check &&
          documentary_verification == o.documentary_verification &&
          selfie_check == o.selfie_check &&
          watchlist_screening == o.watchlist_screening &&
          risk_check == o.risk_check
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [accept_tos, verify_sms, kyc_check, documentary_verification, selfie_check, watchlist_screening, risk_check].hash
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
