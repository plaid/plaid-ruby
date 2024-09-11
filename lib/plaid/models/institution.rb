=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.562.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  # Details relating to a specific financial institution
  class Institution
    # Unique identifier for the institution. Note that the same institution may have multiple records, each with different institution IDs; for example, if the institution has migrated to OAuth, there may be separate `institution_id`s for the OAuth and non-OAuth versions of the institution. Institutions that operate in different countries or with multiple login portals may also have separate `institution_id`s for each country or portal.
    attr_accessor :institution_id

    # The official name of the institution.
    attr_accessor :name

    # A list of the Plaid products supported by the institution. Note that only institutions that support Instant Auth will return `auth` in the product array; institutions that do not list `auth` may still support other Auth methods such as Instant Match or Automated Micro-deposit Verification. To identify institutions that support those methods, use the `auth_metadata` object. For more details, see [Full Auth coverage](https://plaid.com/docs/auth/coverage/). The `income_verification` product here indicates support for Bank Income.
    attr_accessor :products

    # A list of the country codes supported by the institution.
    attr_accessor :country_codes

    # The URL for the institution's website
    attr_accessor :url

    # Hexadecimal representation of the primary color used by the institution
    attr_accessor :primary_color

    # Base64 encoded representation of the institution's logo, returned as a base64 encoded 152x152 PNG. Not all institutions' logos are available.
    attr_accessor :logo

    # A list of routing numbers known to be associated with the institution. This list is provided for the purpose of looking up institutions by routing number. It is generally comprehensive but is not guaranteed to be a complete list of routing numbers for an institution.
    attr_accessor :routing_numbers

    # A partial list of DTC numbers associated with the institution.
    attr_accessor :dtc_numbers

    # Indicates that the institution has an OAuth login flow. This will be `true` if OAuth is supported for any Items associated with the institution, even if the institution also supports non-OAuth connections.
    attr_accessor :oauth

    attr_accessor :status

    attr_accessor :payment_initiation_metadata

    attr_accessor :auth_metadata

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'institution_id' => :'institution_id',
        :'name' => :'name',
        :'products' => :'products',
        :'country_codes' => :'country_codes',
        :'url' => :'url',
        :'primary_color' => :'primary_color',
        :'logo' => :'logo',
        :'routing_numbers' => :'routing_numbers',
        :'dtc_numbers' => :'dtc_numbers',
        :'oauth' => :'oauth',
        :'status' => :'status',
        :'payment_initiation_metadata' => :'payment_initiation_metadata',
        :'auth_metadata' => :'auth_metadata'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'institution_id' => :'String',
        :'name' => :'String',
        :'products' => :'Array<Products>',
        :'country_codes' => :'Array<CountryCode>',
        :'url' => :'String',
        :'primary_color' => :'String',
        :'logo' => :'String',
        :'routing_numbers' => :'Array<String>',
        :'dtc_numbers' => :'Array<String>',
        :'oauth' => :'Boolean',
        :'status' => :'InstitutionStatus',
        :'payment_initiation_metadata' => :'PaymentInitiationMetadata',
        :'auth_metadata' => :'AuthMetadata'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'url',
        :'primary_color',
        :'logo',
        :'status',
        :'payment_initiation_metadata',
        :'auth_metadata'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::Institution` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::Institution`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'institution_id')
        self.institution_id = attributes[:'institution_id']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'products')
        if (value = attributes[:'products']).is_a?(Array)
          self.products = value
        end
      end

      if attributes.key?(:'country_codes')
        if (value = attributes[:'country_codes']).is_a?(Array)
          self.country_codes = value
        end
      end

      if attributes.key?(:'url')
        self.url = attributes[:'url']
      end

      if attributes.key?(:'primary_color')
        self.primary_color = attributes[:'primary_color']
      end

      if attributes.key?(:'logo')
        self.logo = attributes[:'logo']
      end

      if attributes.key?(:'routing_numbers')
        if (value = attributes[:'routing_numbers']).is_a?(Array)
          self.routing_numbers = value
        end
      end

      if attributes.key?(:'dtc_numbers')
        if (value = attributes[:'dtc_numbers']).is_a?(Array)
          self.dtc_numbers = value
        end
      end

      if attributes.key?(:'oauth')
        self.oauth = attributes[:'oauth']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'payment_initiation_metadata')
        self.payment_initiation_metadata = attributes[:'payment_initiation_metadata']
      end

      if attributes.key?(:'auth_metadata')
        self.auth_metadata = attributes[:'auth_metadata']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @institution_id.nil?
        invalid_properties.push('invalid value for "institution_id", institution_id cannot be nil.')
      end

      if @name.nil?
        invalid_properties.push('invalid value for "name", name cannot be nil.')
      end

      if @products.nil?
        invalid_properties.push('invalid value for "products", products cannot be nil.')
      end

      if @country_codes.nil?
        invalid_properties.push('invalid value for "country_codes", country_codes cannot be nil.')
      end

      if @routing_numbers.nil?
        invalid_properties.push('invalid value for "routing_numbers", routing_numbers cannot be nil.')
      end

      if @oauth.nil?
        invalid_properties.push('invalid value for "oauth", oauth cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @institution_id.nil?
      return false if @name.nil?
      return false if @products.nil?
      return false if @country_codes.nil?
      return false if @routing_numbers.nil?
      return false if @oauth.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          institution_id == o.institution_id &&
          name == o.name &&
          products == o.products &&
          country_codes == o.country_codes &&
          url == o.url &&
          primary_color == o.primary_color &&
          logo == o.logo &&
          routing_numbers == o.routing_numbers &&
          dtc_numbers == o.dtc_numbers &&
          oauth == o.oauth &&
          status == o.status &&
          payment_initiation_metadata == o.payment_initiation_metadata &&
          auth_metadata == o.auth_metadata
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [institution_id, name, products, country_codes, url, primary_color, logo, routing_numbers, dtc_numbers, oauth, status, payment_initiation_metadata, auth_metadata].hash
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
