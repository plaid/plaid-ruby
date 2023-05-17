=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.370.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.1.1

=end

require 'date'
require 'time'

module Plaid
  # Details about an asset.
  class CreditFreddieMacAssetDetailVOE25
    # A vendor created unique Identifier.
    attr_accessor :asset_unique_identifier

    # A unique alphanumeric string identifying an asset.
    attr_accessor :asset_account_identifier

    # Account Report As of Date / Create Date. Format YYYY-MM-DD
    attr_accessor :asset_as_of_date

    # A text description that further defines the Asset. This could be used to describe the shares associated with the stocks, bonds or mutual funds, retirement funds or business owned that the borrower has disclosed (named) as an asset.
    attr_accessor :asset_description

    attr_accessor :asset_type

    # Additional Asset Decription some examples are Investment Tax-Deferred , Loan, 401K, 403B, Checking, Money Market, Credit Card,ROTH,529,Biller,ROLLOVER,CD,Savings,Investment Taxable, IRA, Mortgage, Line Of Credit.
    attr_accessor :asset_type_additional_description

    # The Number of days requested made to the Financial Institution. Example When looking for 3 months of data from the FI, pass in 90 days.
    attr_accessor :asset_days_requested_count

    # Ownership type of the asset account.
    attr_accessor :asset_ownership_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'asset_unique_identifier' => :'AssetUniqueIdentifier',
        :'asset_account_identifier' => :'AssetAccountIdentifier',
        :'asset_as_of_date' => :'AssetAsOfDate',
        :'asset_description' => :'AssetDescription',
        :'asset_type' => :'AssetType',
        :'asset_type_additional_description' => :'AssetTypeAdditionalDescription',
        :'asset_days_requested_count' => :'AssetDaysRequestedCount',
        :'asset_ownership_type' => :'AssetOwnershipType'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'asset_unique_identifier' => :'String',
        :'asset_account_identifier' => :'String',
        :'asset_as_of_date' => :'String',
        :'asset_description' => :'String',
        :'asset_type' => :'AssetType',
        :'asset_type_additional_description' => :'String',
        :'asset_days_requested_count' => :'Integer',
        :'asset_ownership_type' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'asset_description',
        :'asset_type_additional_description',
        :'asset_ownership_type'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::CreditFreddieMacAssetDetailVOE25` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::CreditFreddieMacAssetDetailVOE25`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'asset_unique_identifier')
        self.asset_unique_identifier = attributes[:'asset_unique_identifier']
      end

      if attributes.key?(:'asset_account_identifier')
        self.asset_account_identifier = attributes[:'asset_account_identifier']
      end

      if attributes.key?(:'asset_as_of_date')
        self.asset_as_of_date = attributes[:'asset_as_of_date']
      end

      if attributes.key?(:'asset_description')
        self.asset_description = attributes[:'asset_description']
      end

      if attributes.key?(:'asset_type')
        self.asset_type = attributes[:'asset_type']
      end

      if attributes.key?(:'asset_type_additional_description')
        self.asset_type_additional_description = attributes[:'asset_type_additional_description']
      end

      if attributes.key?(:'asset_days_requested_count')
        self.asset_days_requested_count = attributes[:'asset_days_requested_count']
      end

      if attributes.key?(:'asset_ownership_type')
        self.asset_ownership_type = attributes[:'asset_ownership_type']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @asset_unique_identifier.nil?
        invalid_properties.push('invalid value for "asset_unique_identifier", asset_unique_identifier cannot be nil.')
      end

      if @asset_account_identifier.nil?
        invalid_properties.push('invalid value for "asset_account_identifier", asset_account_identifier cannot be nil.')
      end

      if @asset_as_of_date.nil?
        invalid_properties.push('invalid value for "asset_as_of_date", asset_as_of_date cannot be nil.')
      end

      if @asset_type.nil?
        invalid_properties.push('invalid value for "asset_type", asset_type cannot be nil.')
      end

      if @asset_days_requested_count.nil?
        invalid_properties.push('invalid value for "asset_days_requested_count", asset_days_requested_count cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @asset_unique_identifier.nil?
      return false if @asset_account_identifier.nil?
      return false if @asset_as_of_date.nil?
      return false if @asset_type.nil?
      return false if @asset_days_requested_count.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          asset_unique_identifier == o.asset_unique_identifier &&
          asset_account_identifier == o.asset_account_identifier &&
          asset_as_of_date == o.asset_as_of_date &&
          asset_description == o.asset_description &&
          asset_type == o.asset_type &&
          asset_type_additional_description == o.asset_type_additional_description &&
          asset_days_requested_count == o.asset_days_requested_count &&
          asset_ownership_type == o.asset_ownership_type
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [asset_unique_identifier, asset_account_identifier, asset_as_of_date, asset_description, asset_type, asset_type_additional_description, asset_days_requested_count, asset_ownership_type].hash
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
