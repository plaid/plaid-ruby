=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.534.3

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  # BeaconAccountRiskEvaluateRequest defines the request schema for `/v1/beacon/account_risk/risk/evaluate`
  class BeaconAccountRiskEvaluateRequest
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    attr_accessor :client_id

    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    attr_accessor :secret

    # The access token associated with the Item data is being requested for.
    attr_accessor :access_token

    attr_accessor :options

    # A unique ID that identifies the end user in your system. This ID is used to correlate requests by a user with multiple evaluations and/or multiple linked accounts. Personally identifiable information, such as an email address or phone number, should not be used in the client_user_id.
    attr_accessor :client_user_id

    # Unique identifier of what you are looking to evaluate (account add, information change, etc.) to allow us to tie the activity to the decisions and possible fraud outcome sent via our feedback endpoints. You can use your internal request ID or similar.
    attr_accessor :client_evaluation_id

    attr_accessor :evaluation_reason

    attr_accessor :device

    # The time the event for evaluation has occurred. Populate this field for backfilling data. If you don’t populate this field, we’ll use the timestamp at the time of receipt. Use ISO 8601 format (YYYY-MM-DDTHH:mm:ssZ).
    attr_accessor :evaluate_time

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
        :'client_id' => :'client_id',
        :'secret' => :'secret',
        :'access_token' => :'access_token',
        :'options' => :'options',
        :'client_user_id' => :'client_user_id',
        :'client_evaluation_id' => :'client_evaluation_id',
        :'evaluation_reason' => :'evaluation_reason',
        :'device' => :'device',
        :'evaluate_time' => :'evaluate_time'
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
        :'options' => :'BeaconAccountRiskEvaluateRequestOptions',
        :'client_user_id' => :'String',
        :'client_evaluation_id' => :'String',
        :'evaluation_reason' => :'BeaconAccountRiskEvaluateEvaluationReason',
        :'device' => :'SignalDevice',
        :'evaluate_time' => :'String'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::BeaconAccountRiskEvaluateRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::BeaconAccountRiskEvaluateRequest`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
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

      if attributes.key?(:'options')
        self.options = attributes[:'options']
      end

      if attributes.key?(:'client_user_id')
        self.client_user_id = attributes[:'client_user_id']
      end

      if attributes.key?(:'client_evaluation_id')
        self.client_evaluation_id = attributes[:'client_evaluation_id']
      end

      if attributes.key?(:'evaluation_reason')
        self.evaluation_reason = attributes[:'evaluation_reason']
      end

      if attributes.key?(:'device')
        self.device = attributes[:'device']
      end

      if attributes.key?(:'evaluate_time')
        self.evaluate_time = attributes[:'evaluate_time']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@client_user_id.nil? && @client_user_id.to_s.length > 36
        invalid_properties.push('invalid value for "client_user_id", the character length must be smaller than or equal to 36.')
      end

      if !@client_user_id.nil? && @client_user_id.to_s.length < 1
        invalid_properties.push('invalid value for "client_user_id", the character length must be great than or equal to 1.')
      end


      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@client_user_id.nil? && @client_user_id.to_s.length > 36
      return false if !@client_user_id.nil? && @client_user_id.to_s.length < 1
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] client_user_id Value to be assigned
    def client_user_id=(client_user_id)
      if !client_user_id.nil? && client_user_id.to_s.length > 36
        fail ArgumentError, 'invalid value for "client_user_id", the character length must be smaller than or equal to 36.'
      end

      if !client_user_id.nil? && client_user_id.to_s.length < 1
        fail ArgumentError, 'invalid value for "client_user_id", the character length must be great than or equal to 1.'
      end


      @client_user_id = client_user_id
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          client_id == o.client_id &&
          secret == o.secret &&
          access_token == o.access_token &&
          options == o.options &&
          client_user_id == o.client_user_id &&
          client_evaluation_id == o.client_evaluation_id &&
          evaluation_reason == o.evaluation_reason &&
          device == o.device &&
          evaluate_time == o.evaluate_time
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [client_id, secret, access_token, options, client_user_id, client_evaluation_id, evaluation_reason, device, evaluate_time].hash
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
