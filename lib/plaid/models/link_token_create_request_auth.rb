=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.214.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.1.1

=end

require 'date'
require 'time'

module Plaid
  # Specifies options for initializing Link for use with the Auth product. This field can be used to enable or disable extended Auth flows for the resulting Link session. Omitting any field will result in a default that can be configured by your account manager.
  class LinkTokenCreateRequestAuth
    # Specifies whether Auth Type Select is enabled for the Link session, allowing the end user to choose between linking instantly or manually prior to selecting their financial institution. Note that this can only be true if `same_day_microdeposits_enabled` is set to true.
    attr_accessor :auth_type_select_enabled

    # Specifies whether the Link session is enabled for the Automated Micro-deposits flow.
    attr_accessor :automated_microdeposits_enabled

    # Specifies whether the Link session is enabled for the Instant Match flow. As of November 2022, Instant Match will be enabled by default. Instant Match can be disabled by setting this field to `false`.
    attr_accessor :instant_match_enabled

    # Specifies whether the Link session is enabled for the Same Day Micro-deposits flow.
    attr_accessor :same_day_microdeposits_enabled

    # This field has been deprecated in favor of `auth_type_select_enabled`.
    attr_accessor :flow_type

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
        :'auth_type_select_enabled' => :'auth_type_select_enabled',
        :'automated_microdeposits_enabled' => :'automated_microdeposits_enabled',
        :'instant_match_enabled' => :'instant_match_enabled',
        :'same_day_microdeposits_enabled' => :'same_day_microdeposits_enabled',
        :'flow_type' => :'flow_type'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'auth_type_select_enabled' => :'Boolean',
        :'automated_microdeposits_enabled' => :'Boolean',
        :'instant_match_enabled' => :'Boolean',
        :'same_day_microdeposits_enabled' => :'Boolean',
        :'flow_type' => :'String'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::LinkTokenCreateRequestAuth` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::LinkTokenCreateRequestAuth`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'auth_type_select_enabled')
        self.auth_type_select_enabled = attributes[:'auth_type_select_enabled']
      else
        self.auth_type_select_enabled = false
      end

      if attributes.key?(:'automated_microdeposits_enabled')
        self.automated_microdeposits_enabled = attributes[:'automated_microdeposits_enabled']
      end

      if attributes.key?(:'instant_match_enabled')
        self.instant_match_enabled = attributes[:'instant_match_enabled']
      end

      if attributes.key?(:'same_day_microdeposits_enabled')
        self.same_day_microdeposits_enabled = attributes[:'same_day_microdeposits_enabled']
      end

      if attributes.key?(:'flow_type')
        self.flow_type = attributes[:'flow_type']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      flow_type_validator = EnumAttributeValidator.new('String', ["FLEXIBLE_AUTH"])
      return false unless flow_type_validator.valid?(@flow_type)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] flow_type Object to be assigned
    def flow_type=(flow_type)
      validator = EnumAttributeValidator.new('String', ["FLEXIBLE_AUTH"])
      unless validator.valid?(flow_type)
        fail ArgumentError, "invalid value for \"flow_type\", must be one of #{validator.allowable_values}."
      end
      @flow_type = flow_type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          auth_type_select_enabled == o.auth_type_select_enabled &&
          automated_microdeposits_enabled == o.automated_microdeposits_enabled &&
          instant_match_enabled == o.instant_match_enabled &&
          same_day_microdeposits_enabled == o.same_day_microdeposits_enabled &&
          flow_type == o.flow_type
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [auth_type_select_enabled, automated_microdeposits_enabled, instant_match_enabled, same_day_microdeposits_enabled, flow_type].hash
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
