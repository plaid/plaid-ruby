=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.391.1

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.1.0

=end

require 'date'
require 'time'

module Plaid
  # A grouping of the Plaid produced transaction enhancement fields.
  class Enhancements
    # The name of the primary counterparty, such as the merchant or the financial institution, as extracted by Plaid from the raw description.
    attr_accessor :merchant_name

    # The website associated with this transaction, if available.
    attr_accessor :website

    # The URL of a logo associated with this transaction, if available. The logo is formatted as a 100x100 pixel PNG file.
    attr_accessor :logo_url

    # The check number of the transaction. This field is only populated for check transactions.
    attr_accessor :check_number

    attr_accessor :payment_channel

    # The ID of the category to which this transaction belongs. For a full list of categories, see [`/categories/get`](https://plaid.com/docs/api/products/transactions/#categoriesget).
    attr_accessor :category_id

    # A hierarchical array of the categories to which this transaction belongs. For a full list of categories, see [`/categories/get`](https://plaid.com/docs/api/products/transactions/#categoriesget).
    attr_accessor :category

    attr_accessor :location

    attr_accessor :personal_finance_category

    # A link to the icon associated with the primary personal finance category. The logo will always be 100x100 pixels.
    attr_accessor :personal_finance_category_icon_url

    # The counterparties present in the transaction. Counterparties, such as the merchant or the financial institution, are extracted by Plaid from the raw description.
    attr_accessor :counterparties

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'merchant_name' => :'merchant_name',
        :'website' => :'website',
        :'logo_url' => :'logo_url',
        :'check_number' => :'check_number',
        :'payment_channel' => :'payment_channel',
        :'category_id' => :'category_id',
        :'category' => :'category',
        :'location' => :'location',
        :'personal_finance_category' => :'personal_finance_category',
        :'personal_finance_category_icon_url' => :'personal_finance_category_icon_url',
        :'counterparties' => :'counterparties'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'merchant_name' => :'String',
        :'website' => :'String',
        :'logo_url' => :'String',
        :'check_number' => :'String',
        :'payment_channel' => :'PaymentChannel',
        :'category_id' => :'String',
        :'category' => :'Array<String>',
        :'location' => :'Location',
        :'personal_finance_category' => :'PersonalFinanceCategory',
        :'personal_finance_category_icon_url' => :'String',
        :'counterparties' => :'Array<Counterparty>'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'merchant_name',
        :'website',
        :'logo_url',
        :'check_number',
        :'category_id',
        :'personal_finance_category',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::Enhancements` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::Enhancements`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'merchant_name')
        self.merchant_name = attributes[:'merchant_name']
      end

      if attributes.key?(:'website')
        self.website = attributes[:'website']
      end

      if attributes.key?(:'logo_url')
        self.logo_url = attributes[:'logo_url']
      end

      if attributes.key?(:'check_number')
        self.check_number = attributes[:'check_number']
      end

      if attributes.key?(:'payment_channel')
        self.payment_channel = attributes[:'payment_channel']
      end

      if attributes.key?(:'category_id')
        self.category_id = attributes[:'category_id']
      end

      if attributes.key?(:'category')
        if (value = attributes[:'category']).is_a?(Array)
          self.category = value
        end
      end

      if attributes.key?(:'location')
        self.location = attributes[:'location']
      end

      if attributes.key?(:'personal_finance_category')
        self.personal_finance_category = attributes[:'personal_finance_category']
      end

      if attributes.key?(:'personal_finance_category_icon_url')
        self.personal_finance_category_icon_url = attributes[:'personal_finance_category_icon_url']
      end

      if attributes.key?(:'counterparties')
        if (value = attributes[:'counterparties']).is_a?(Array)
          self.counterparties = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @payment_channel.nil?
        invalid_properties.push('invalid value for "payment_channel", payment_channel cannot be nil.')
      end

      if @category.nil?
        invalid_properties.push('invalid value for "category", category cannot be nil.')
      end

      if @location.nil?
        invalid_properties.push('invalid value for "location", location cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @payment_channel.nil?
      return false if @category.nil?
      return false if @location.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          merchant_name == o.merchant_name &&
          website == o.website &&
          logo_url == o.logo_url &&
          check_number == o.check_number &&
          payment_channel == o.payment_channel &&
          category_id == o.category_id &&
          category == o.category &&
          location == o.location &&
          personal_finance_category == o.personal_finance_category &&
          personal_finance_category_icon_url == o.personal_finance_category_icon_url &&
          counterparties == o.counterparties
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [merchant_name, website, logo_url, check_number, payment_channel, category_id, category, location, personal_finance_category, personal_finance_category_icon_url, counterparties].hash
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
