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
  # SandboxIncomeFireWebhookRequest defines the request schema for `/sandbox/income/fire_webhook`
  class SandboxIncomeFireWebhookRequest
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    attr_accessor :client_id

    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    attr_accessor :secret

    # The Item ID associated with the verification.
    attr_accessor :item_id

    # The Plaid `user_id` of the User associated with this webhook, warning, or error.
    attr_accessor :user_id

    # The URL to which the webhook should be sent.
    attr_accessor :webhook

    # `VERIFICATION_STATUS_PROCESSING_COMPLETE`: The income verification status processing has completed. If the user uploaded multiple documents, this webhook will fire when all documents have finished processing. Call the `/income/verification/paystubs/get` endpoint and check the document metadata to see which documents were successfully parsed.  `VERIFICATION_STATUS_PROCESSING_FAILED`: A failure occurred when attempting to process the verification documentation.  `VERIFICATION_STATUS_PENDING_APPROVAL`: (deprecated) The income verification has been sent to the user for review.
    attr_accessor :verification_status

    attr_accessor :webhook_code

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
        :'item_id' => :'item_id',
        :'user_id' => :'user_id',
        :'webhook' => :'webhook',
        :'verification_status' => :'verification_status',
        :'webhook_code' => :'webhook_code'
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
        :'item_id' => :'String',
        :'user_id' => :'String',
        :'webhook' => :'String',
        :'verification_status' => :'String',
        :'webhook_code' => :'SandboxIncomeWebhookFireRequestWebhookCode'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::SandboxIncomeFireWebhookRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::SandboxIncomeFireWebhookRequest`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'client_id')
        self.client_id = attributes[:'client_id']
      end

      if attributes.key?(:'secret')
        self.secret = attributes[:'secret']
      end

      if attributes.key?(:'item_id')
        self.item_id = attributes[:'item_id']
      end

      if attributes.key?(:'user_id')
        self.user_id = attributes[:'user_id']
      end

      if attributes.key?(:'webhook')
        self.webhook = attributes[:'webhook']
      end

      if attributes.key?(:'verification_status')
        self.verification_status = attributes[:'verification_status']
      end

      if attributes.key?(:'webhook_code')
        self.webhook_code = attributes[:'webhook_code']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @item_id.nil?
        invalid_properties.push('invalid value for "item_id", item_id cannot be nil.')
      end

      if @webhook.nil?
        invalid_properties.push('invalid value for "webhook", webhook cannot be nil.')
      end

      if @webhook_code.nil?
        invalid_properties.push('invalid value for "webhook_code", webhook_code cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @item_id.nil?
      return false if @webhook.nil?
      verification_status_validator = EnumAttributeValidator.new('String', ["VERIFICATION_STATUS_PROCESSING_COMPLETE", "VERIFICATION_STATUS_PROCESSING_FAILED", "VERIFICATION_STATUS_PENDING_APPROVAL"])
      return false unless verification_status_validator.valid?(@verification_status)
      return false if @webhook_code.nil?
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] verification_status Object to be assigned
    def verification_status=(verification_status)
      validator = EnumAttributeValidator.new('String', ["VERIFICATION_STATUS_PROCESSING_COMPLETE", "VERIFICATION_STATUS_PROCESSING_FAILED", "VERIFICATION_STATUS_PENDING_APPROVAL"])
      unless validator.valid?(verification_status)
        fail ArgumentError, "invalid value for \"verification_status\", must be one of #{validator.allowable_values}."
      end
      @verification_status = verification_status
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          client_id == o.client_id &&
          secret == o.secret &&
          item_id == o.item_id &&
          user_id == o.user_id &&
          webhook == o.webhook &&
          verification_status == o.verification_status &&
          webhook_code == o.webhook_code
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [client_id, secret, item_id, user_id, webhook, verification_status, webhook_code].hash
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
