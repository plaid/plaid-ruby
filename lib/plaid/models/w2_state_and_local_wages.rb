=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.645.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  # W2 state and local wages
  class W2StateAndLocalWages
    # State associated with the wage.
    attr_accessor :state

    # State identification number of the employer.
    attr_accessor :employer_state_id_number

    # Wages and tips from the specified state.
    attr_accessor :state_wages_tips

    # Income tax from the specified state.
    attr_accessor :state_income_tax

    # Wages and tips from the locality.
    attr_accessor :local_wages_tips

    # Income tax from the locality.
    attr_accessor :local_income_tax

    # Name of the locality.
    attr_accessor :locality_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'state' => :'state',
        :'employer_state_id_number' => :'employer_state_id_number',
        :'state_wages_tips' => :'state_wages_tips',
        :'state_income_tax' => :'state_income_tax',
        :'local_wages_tips' => :'local_wages_tips',
        :'local_income_tax' => :'local_income_tax',
        :'locality_name' => :'locality_name'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'state' => :'String',
        :'employer_state_id_number' => :'String',
        :'state_wages_tips' => :'String',
        :'state_income_tax' => :'String',
        :'local_wages_tips' => :'String',
        :'local_income_tax' => :'String',
        :'locality_name' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'state',
        :'employer_state_id_number',
        :'state_wages_tips',
        :'state_income_tax',
        :'local_wages_tips',
        :'local_income_tax',
        :'locality_name'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::W2StateAndLocalWages` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::W2StateAndLocalWages`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'state')
        self.state = attributes[:'state']
      end

      if attributes.key?(:'employer_state_id_number')
        self.employer_state_id_number = attributes[:'employer_state_id_number']
      end

      if attributes.key?(:'state_wages_tips')
        self.state_wages_tips = attributes[:'state_wages_tips']
      end

      if attributes.key?(:'state_income_tax')
        self.state_income_tax = attributes[:'state_income_tax']
      end

      if attributes.key?(:'local_wages_tips')
        self.local_wages_tips = attributes[:'local_wages_tips']
      end

      if attributes.key?(:'local_income_tax')
        self.local_income_tax = attributes[:'local_income_tax']
      end

      if attributes.key?(:'locality_name')
        self.locality_name = attributes[:'locality_name']
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
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          state == o.state &&
          employer_state_id_number == o.employer_state_id_number &&
          state_wages_tips == o.state_wages_tips &&
          state_income_tax == o.state_income_tax &&
          local_wages_tips == o.local_wages_tips &&
          local_income_tax == o.local_income_tax &&
          locality_name == o.locality_name
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [state, employer_state_id_number, state_wages_tips, state_income_tax, local_wages_tips, local_income_tax, locality_name].hash
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
