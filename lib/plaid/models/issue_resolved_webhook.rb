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
  # Webhook notifications are sent only when a subscribed issue is marked as resolved. The payload contains details about the issue at the time of its resolution, focusing on the most essential information.
  class IssueResolvedWebhook
    # `ISSUES`
    attr_accessor :webhook_type

    # `ISSUE_RESOLVED`
    attr_accessor :webhook_code

    # The unique identifier of the connectivity issue.
    attr_accessor :issue_id

    # A simple description of the error for the end user.
    attr_accessor :issue_description

    # The time when the issue was marked as resolved.
    attr_accessor :issue_resolved_at

    # The unique identifier of the financial institution involved.
    attr_accessor :institution_id

    # The name of the financial institution involved.
    attr_accessor :institution_name

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'webhook_type' => :'webhook_type',
        :'webhook_code' => :'webhook_code',
        :'issue_id' => :'issue_id',
        :'issue_description' => :'issue_description',
        :'issue_resolved_at' => :'issue_resolved_at',
        :'institution_id' => :'institution_id',
        :'institution_name' => :'institution_name'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'webhook_type' => :'String',
        :'webhook_code' => :'String',
        :'issue_id' => :'String',
        :'issue_description' => :'String',
        :'issue_resolved_at' => :'Time',
        :'institution_id' => :'String',
        :'institution_name' => :'String'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::IssueResolvedWebhook` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::IssueResolvedWebhook`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'webhook_type')
        self.webhook_type = attributes[:'webhook_type']
      end

      if attributes.key?(:'webhook_code')
        self.webhook_code = attributes[:'webhook_code']
      end

      if attributes.key?(:'issue_id')
        self.issue_id = attributes[:'issue_id']
      end

      if attributes.key?(:'issue_description')
        self.issue_description = attributes[:'issue_description']
      end

      if attributes.key?(:'issue_resolved_at')
        self.issue_resolved_at = attributes[:'issue_resolved_at']
      end

      if attributes.key?(:'institution_id')
        self.institution_id = attributes[:'institution_id']
      end

      if attributes.key?(:'institution_name')
        self.institution_name = attributes[:'institution_name']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @webhook_type.nil?
        invalid_properties.push('invalid value for "webhook_type", webhook_type cannot be nil.')
      end

      if @webhook_code.nil?
        invalid_properties.push('invalid value for "webhook_code", webhook_code cannot be nil.')
      end

      if @issue_id.nil?
        invalid_properties.push('invalid value for "issue_id", issue_id cannot be nil.')
      end

      if @issue_description.nil?
        invalid_properties.push('invalid value for "issue_description", issue_description cannot be nil.')
      end

      if @issue_resolved_at.nil?
        invalid_properties.push('invalid value for "issue_resolved_at", issue_resolved_at cannot be nil.')
      end

      if @institution_id.nil?
        invalid_properties.push('invalid value for "institution_id", institution_id cannot be nil.')
      end

      if @institution_name.nil?
        invalid_properties.push('invalid value for "institution_name", institution_name cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @webhook_type.nil?
      return false if @webhook_code.nil?
      return false if @issue_id.nil?
      return false if @issue_description.nil?
      return false if @issue_resolved_at.nil?
      return false if @institution_id.nil?
      return false if @institution_name.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          webhook_type == o.webhook_type &&
          webhook_code == o.webhook_code &&
          issue_id == o.issue_id &&
          issue_description == o.issue_description &&
          issue_resolved_at == o.issue_resolved_at &&
          institution_id == o.institution_id &&
          institution_name == o.institution_name
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [webhook_type, webhook_code, issue_id, issue_description, issue_resolved_at, institution_id, institution_name].hash
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
