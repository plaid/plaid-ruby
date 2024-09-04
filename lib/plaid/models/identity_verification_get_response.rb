=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.555.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  # A identity verification attempt represents a customer's attempt to verify their identity, reflecting the required steps for completing the session, the results for each step, and information collected in the process.
  class IdentityVerificationGetResponse
    # ID of the associated Identity Verification attempt.
    attr_accessor :id

    # A unique ID that identifies the end user in your system. This ID can also be used to associate user-specific data from other Plaid products. Financial Account Matching requires this field and the `/link/token/create` `client_user_id` to be consistent. Personally identifiable information, such as an email address or phone number, should not be used in the `client_user_id`.
    attr_accessor :client_user_id

    # An ISO8601 formatted timestamp.
    attr_accessor :created_at

    # An ISO8601 formatted timestamp.
    attr_accessor :completed_at

    # The ID for the Identity Verification preceding this session. This field will only be filled if the current Identity Verification is a retry of a previous attempt.
    attr_accessor :previous_attempt_id

    # A shareable URL that can be sent directly to the user to complete verification
    attr_accessor :shareable_url

    attr_accessor :template

    attr_accessor :user

    attr_accessor :status

    attr_accessor :steps

    attr_accessor :documentary_verification

    attr_accessor :selfie_check

    attr_accessor :kyc_check

    attr_accessor :risk_check

    # ID of the associated screening.
    attr_accessor :watchlist_screening_id

    # An ISO8601 formatted timestamp.
    attr_accessor :redacted_at

    # A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive.
    attr_accessor :request_id

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
        :'id' => :'id',
        :'client_user_id' => :'client_user_id',
        :'created_at' => :'created_at',
        :'completed_at' => :'completed_at',
        :'previous_attempt_id' => :'previous_attempt_id',
        :'shareable_url' => :'shareable_url',
        :'template' => :'template',
        :'user' => :'user',
        :'status' => :'status',
        :'steps' => :'steps',
        :'documentary_verification' => :'documentary_verification',
        :'selfie_check' => :'selfie_check',
        :'kyc_check' => :'kyc_check',
        :'risk_check' => :'risk_check',
        :'watchlist_screening_id' => :'watchlist_screening_id',
        :'redacted_at' => :'redacted_at',
        :'request_id' => :'request_id'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id' => :'String',
        :'client_user_id' => :'String',
        :'created_at' => :'Time',
        :'completed_at' => :'Time',
        :'previous_attempt_id' => :'String',
        :'shareable_url' => :'String',
        :'template' => :'IdentityVerificationTemplateReference',
        :'user' => :'IdentityVerificationUserData',
        :'status' => :'IdentityVerificationStatus',
        :'steps' => :'IdentityVerificationStepSummary',
        :'documentary_verification' => :'DocumentaryVerification',
        :'selfie_check' => :'SelfieCheck',
        :'kyc_check' => :'KYCCheckDetails',
        :'risk_check' => :'RiskCheckDetails',
        :'watchlist_screening_id' => :'String',
        :'redacted_at' => :'Time',
        :'request_id' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'completed_at',
        :'previous_attempt_id',
        :'shareable_url',
        :'documentary_verification',
        :'selfie_check',
        :'kyc_check',
        :'risk_check',
        :'watchlist_screening_id',
        :'redacted_at',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::IdentityVerificationGetResponse` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::IdentityVerificationGetResponse`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'client_user_id')
        self.client_user_id = attributes[:'client_user_id']
      end

      if attributes.key?(:'created_at')
        self.created_at = attributes[:'created_at']
      end

      if attributes.key?(:'completed_at')
        self.completed_at = attributes[:'completed_at']
      end

      if attributes.key?(:'previous_attempt_id')
        self.previous_attempt_id = attributes[:'previous_attempt_id']
      end

      if attributes.key?(:'shareable_url')
        self.shareable_url = attributes[:'shareable_url']
      end

      if attributes.key?(:'template')
        self.template = attributes[:'template']
      end

      if attributes.key?(:'user')
        self.user = attributes[:'user']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'steps')
        self.steps = attributes[:'steps']
      end

      if attributes.key?(:'documentary_verification')
        self.documentary_verification = attributes[:'documentary_verification']
      end

      if attributes.key?(:'selfie_check')
        self.selfie_check = attributes[:'selfie_check']
      end

      if attributes.key?(:'kyc_check')
        self.kyc_check = attributes[:'kyc_check']
      end

      if attributes.key?(:'risk_check')
        self.risk_check = attributes[:'risk_check']
      end

      if attributes.key?(:'watchlist_screening_id')
        self.watchlist_screening_id = attributes[:'watchlist_screening_id']
      end

      if attributes.key?(:'redacted_at')
        self.redacted_at = attributes[:'redacted_at']
      end

      if attributes.key?(:'request_id')
        self.request_id = attributes[:'request_id']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @id.nil?
        invalid_properties.push('invalid value for "id", id cannot be nil.')
      end

      if @client_user_id.nil?
        invalid_properties.push('invalid value for "client_user_id", client_user_id cannot be nil.')
      end

      if @created_at.nil?
        invalid_properties.push('invalid value for "created_at", created_at cannot be nil.')
      end

      if @template.nil?
        invalid_properties.push('invalid value for "template", template cannot be nil.')
      end

      if @user.nil?
        invalid_properties.push('invalid value for "user", user cannot be nil.')
      end

      if @status.nil?
        invalid_properties.push('invalid value for "status", status cannot be nil.')
      end

      if @steps.nil?
        invalid_properties.push('invalid value for "steps", steps cannot be nil.')
      end

      if @request_id.nil?
        invalid_properties.push('invalid value for "request_id", request_id cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @id.nil?
      return false if @client_user_id.nil?
      return false if @created_at.nil?
      return false if @template.nil?
      return false if @user.nil?
      return false if @status.nil?
      return false if @steps.nil?
      return false if @request_id.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          client_user_id == o.client_user_id &&
          created_at == o.created_at &&
          completed_at == o.completed_at &&
          previous_attempt_id == o.previous_attempt_id &&
          shareable_url == o.shareable_url &&
          template == o.template &&
          user == o.user &&
          status == o.status &&
          steps == o.steps &&
          documentary_verification == o.documentary_verification &&
          selfie_check == o.selfie_check &&
          kyc_check == o.kyc_check &&
          risk_check == o.risk_check &&
          watchlist_screening_id == o.watchlist_screening_id &&
          redacted_at == o.redacted_at &&
          request_id == o.request_id
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, client_user_id, created_at, completed_at, previous_attempt_id, shareable_url, template, user, status, steps, documentary_verification, selfie_check, kyc_check, risk_check, watchlist_screening_id, redacted_at, request_id].hash
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
