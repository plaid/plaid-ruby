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
  # GetRecipientResponse defines the response schema for `/fdx/recipient/{recipientId}`
  class GetRecipientResponse
    # The recipient identifier
    attr_accessor :recipient_id

    # The recipient name displayed by the Data Provider during the consent flow
    attr_accessor :client_name

    # Data Recipient Logo URL location
    attr_accessor :logo_uri

    # The legal name of the recipient
    attr_accessor :third_party_legal_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'recipient_id' => :'recipient_id',
        :'client_name' => :'client_name',
        :'logo_uri' => :'logo_uri',
        :'third_party_legal_name' => :'third_party_legal_name'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'recipient_id' => :'String',
        :'client_name' => :'String',
        :'logo_uri' => :'String',
        :'third_party_legal_name' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'logo_uri',
      ])
    end

    # List of class defined in allOf (OpenAPI v3)
    def self.openapi_all_of
      [
      :'FDXRecipientMetadata'
      ]
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::GetRecipientResponse` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::GetRecipientResponse`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'recipient_id')
        self.recipient_id = attributes[:'recipient_id']
      end

      if attributes.key?(:'client_name')
        self.client_name = attributes[:'client_name']
      end

      if attributes.key?(:'logo_uri')
        self.logo_uri = attributes[:'logo_uri']
      end

      if attributes.key?(:'third_party_legal_name')
        self.third_party_legal_name = attributes[:'third_party_legal_name']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @recipient_id.nil?
        invalid_properties.push('invalid value for "recipient_id", recipient_id cannot be nil.')
      end

      if @recipient_id.to_s.length > 256
        invalid_properties.push('invalid value for "recipient_id", the character length must be smaller than or equal to 256.')
      end


      if @client_name.nil?
        invalid_properties.push('invalid value for "client_name", client_name cannot be nil.')
      end

      if @client_name.to_s.length > 256
        invalid_properties.push('invalid value for "client_name", the character length must be smaller than or equal to 256.')
      end


      if @third_party_legal_name.nil?
        invalid_properties.push('invalid value for "third_party_legal_name", third_party_legal_name cannot be nil.')
      end

      if @third_party_legal_name.to_s.length > 256
        invalid_properties.push('invalid value for "third_party_legal_name", the character length must be smaller than or equal to 256.')
      end


      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @recipient_id.nil?
      return false if @recipient_id.to_s.length > 256
      return false if @client_name.nil?
      return false if @client_name.to_s.length > 256
      return false if @third_party_legal_name.nil?
      return false if @third_party_legal_name.to_s.length > 256
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] recipient_id Value to be assigned
    def recipient_id=(recipient_id)
      if recipient_id.nil?
        fail ArgumentError, 'recipient_id cannot be nil'
      end

      if recipient_id.to_s.length > 256
        fail ArgumentError, 'invalid value for "recipient_id", the character length must be smaller than or equal to 256.'
      end


      @recipient_id = recipient_id
    end

    # Custom attribute writer method with validation
    # @param [Object] client_name Value to be assigned
    def client_name=(client_name)
      if client_name.nil?
        fail ArgumentError, 'client_name cannot be nil'
      end

      if client_name.to_s.length > 256
        fail ArgumentError, 'invalid value for "client_name", the character length must be smaller than or equal to 256.'
      end


      @client_name = client_name
    end

    # Custom attribute writer method with validation
    # @param [Object] third_party_legal_name Value to be assigned
    def third_party_legal_name=(third_party_legal_name)
      if third_party_legal_name.nil?
        fail ArgumentError, 'third_party_legal_name cannot be nil'
      end

      if third_party_legal_name.to_s.length > 256
        fail ArgumentError, 'invalid value for "third_party_legal_name", the character length must be smaller than or equal to 256.'
      end


      @third_party_legal_name = third_party_legal_name
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          recipient_id == o.recipient_id &&
          client_name == o.client_name &&
          logo_uri == o.logo_uri &&
          third_party_legal_name == o.third_party_legal_name
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [recipient_id, client_name, logo_uri, third_party_legal_name].hash
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
