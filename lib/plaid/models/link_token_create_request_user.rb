=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.5.2

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0

=end

require 'date'
require 'time'

module Plaid
  # An object specifying information about the end user who will be linking their account.
  class LinkTokenCreateRequestUser
    # A unique ID representing the end user. Typically this will be a user ID number from your application. Personally identifiable information, such as an email address or phone number, should not be used in the `client_user_id`.
    attr_accessor :client_user_id

    # The user's full legal name. This is an optional field used in the [returning user experience](/docs/link/returning-user) to associate Items to the user.
    attr_accessor :legal_name

    # The user's phone number in [E.164](https://en.wikipedia.org/wiki/E.164) format. This field is optional, but required to enable the [returning user experience](/docs/link/returning-user).
    attr_accessor :phone_number

    # The date and time the phone number was verified in ISO 8601 format (`YYYY-MM-DDThh:mm:ssZ`). This field is optional, but required to enable any [returning user experience](/docs/link/returning-user).   Only pass a verification time for a phone number that you have verified. If you have performed verification but don’t have the time, you may supply a signal value of the start of the UNIX epoch.   Example: `2020-01-01T00:00:00Z` 
    attr_accessor :phone_number_verified_time

    # The user's email address. This field is optional, but required to enable the [pre-authenticated returning user flow](/docs/link/returning-user/#enabling-the-returning-user-experience).
    attr_accessor :email_address

    # The date and time the email address was verified in ISO 8601 format (`YYYY-MM-DDThh:mm:ssZ`). This is an optional field used in the [returning user experience](/docs/link/returning-user).   Only pass a verification time for an email address that you have verified. If you have performed verification but don’t have the time, you may supply a signal value of the start of the UNIX epoch.   Example: `2020-01-01T00:00:00Z`
    attr_accessor :email_address_verified_time

    # To be provided in the format \"ddd-dd-dddd\". This field is optional and will support not-yet-implemented functionality for new products.
    attr_accessor :ssn

    # To be provided in the format \"yyyy-mm-dd\". This field is optional and will support not-yet-implemented functionality for new products.
    attr_accessor :date_of_birth

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'client_user_id' => :'client_user_id',
        :'legal_name' => :'legal_name',
        :'phone_number' => :'phone_number',
        :'phone_number_verified_time' => :'phone_number_verified_time',
        :'email_address' => :'email_address',
        :'email_address_verified_time' => :'email_address_verified_time',
        :'ssn' => :'ssn',
        :'date_of_birth' => :'date_of_birth'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'client_user_id' => :'String',
        :'legal_name' => :'String',
        :'phone_number' => :'String',
        :'phone_number_verified_time' => :'String',
        :'email_address' => :'String',
        :'email_address_verified_time' => :'String',
        :'ssn' => :'String',
        :'date_of_birth' => :'String'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::LinkTokenCreateRequestUser` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::LinkTokenCreateRequestUser`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'client_user_id')
        self.client_user_id = attributes[:'client_user_id']
      end

      if attributes.key?(:'legal_name')
        self.legal_name = attributes[:'legal_name']
      end

      if attributes.key?(:'phone_number')
        self.phone_number = attributes[:'phone_number']
      end

      if attributes.key?(:'phone_number_verified_time')
        self.phone_number_verified_time = attributes[:'phone_number_verified_time']
      end

      if attributes.key?(:'email_address')
        self.email_address = attributes[:'email_address']
      end

      if attributes.key?(:'email_address_verified_time')
        self.email_address_verified_time = attributes[:'email_address_verified_time']
      end

      if attributes.key?(:'ssn')
        self.ssn = attributes[:'ssn']
      end

      if attributes.key?(:'date_of_birth')
        self.date_of_birth = attributes[:'date_of_birth']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @client_user_id.nil?
        invalid_properties.push('invalid value for "client_user_id", client_user_id cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @client_user_id.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          client_user_id == o.client_user_id &&
          legal_name == o.legal_name &&
          phone_number == o.phone_number &&
          phone_number_verified_time == o.phone_number_verified_time &&
          email_address == o.email_address &&
          email_address_verified_time == o.email_address_verified_time &&
          ssn == o.ssn &&
          date_of_birth == o.date_of_birth
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [client_user_id, legal_name, phone_number, phone_number_verified_time, email_address, email_address_verified_time, ssn, date_of_birth].hash
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