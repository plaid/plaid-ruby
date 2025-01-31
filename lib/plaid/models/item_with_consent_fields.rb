=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.614.1

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  # Metadata about the Item
  class ItemWithConsentFields
    # The Plaid Item ID. The `item_id` is always unique; linking the same account at the same institution twice will result in two Items with different `item_id` values. Like all Plaid identifiers, the `item_id` is case-sensitive.
    attr_accessor :item_id

    # The Plaid Institution ID associated with the Item. Field is `null` for Items created without an institution connection, such as Items created via Same Day Micro-deposits.
    attr_accessor :institution_id

    # The name of the institution associated with the Item. Field is `null` for Items created without an institution connection, such as Items created via Same Day Micro-deposits.
    attr_accessor :institution_name

    # The URL registered to receive webhooks for the Item.
    attr_accessor :webhook

    attr_accessor :auth_method

    attr_accessor :error

    # A list of products available for the Item that have not yet been accessed. The contents of this array will be mutually exclusive with `billed_products`.
    attr_accessor :available_products

    # A list of products that have been billed for the Item. The contents of this array will be mutually exclusive with `available_products`. Note - `billed_products` is populated in all environments but only requests in Production are billed. Also note that products that are billed on a pay-per-call basis rather than a pay-per-Item basis, such as `balance`, will not appear here. 
    attr_accessor :billed_products

    # A list of products added to the Item. In almost all cases, this will be the same as the `billed_products` field. For some products, it is possible for the product to be added to an Item but not yet billed (e.g. Assets, before `/asset_report/create` has been called, or Auth or Identity when added as Optional Products but before their endpoints have been called), in which case the product may appear in `products` but not in `billed_products`. 
    attr_accessor :products

    # A list of products that the user has consented to for the Item via [Data Transparency Messaging](/docs/link/data-transparency-messaging-migration-guide). This will consist of all products where both of the following are true: the user has consented to the required data scopes for that product and you have Production access for that product. 
    attr_accessor :consented_products

    # The date and time at which the Item's access consent will expire, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format. If the Item does not have consent expiration scheduled, this field will be `null`. Currently, only institutions in Europe and a small number of institutions in the US have expiring consent. Closer to the 1033 compliance deadline of April 1, 2026, expiration times will be populated more widely. For more details, see [Data Transparency Messaging consent expiration](https://plaid.com/docs/link/data-transparency-messaging-migration-guide/#consent-expiration-and-reauthorization.)
    attr_accessor :consent_expiration_time

    # Indicates whether an Item requires user interaction to be updated, which can be the case for Items with some forms of two-factor authentication.  `background` - Item can be updated in the background  `user_present_required` - Item requires user interaction to be updated
    attr_accessor :update_type

    # The date and time when the Item was created, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format.
    attr_accessor :created_at

    # A list of use cases that the user has consented to for the Item via [Data Transparency Messaging](/docs/link/data-transparency-messaging-migration-guide).   You can see the full list of use cases or update the list of use cases to request at any time via the Link Customization section of the [Plaid Dashboard](https://dashboard.plaid.com/link/data-transparency-v5).
    attr_accessor :consented_use_cases

    # A list of data scopes that the user has consented to for the Item via [Data Transparency Messaging](/docs/link/data-transparency-messaging-migration-guide). These are based on the `consented_products`; see the [full mapping](/docs/link/data-transparency-messaging-migration-guide/#data-scopes-by-product) of data scopes and products.
    attr_accessor :consented_data_scopes

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
        :'item_id' => :'item_id',
        :'institution_id' => :'institution_id',
        :'institution_name' => :'institution_name',
        :'webhook' => :'webhook',
        :'auth_method' => :'auth_method',
        :'error' => :'error',
        :'available_products' => :'available_products',
        :'billed_products' => :'billed_products',
        :'products' => :'products',
        :'consented_products' => :'consented_products',
        :'consent_expiration_time' => :'consent_expiration_time',
        :'update_type' => :'update_type',
        :'created_at' => :'created_at',
        :'consented_use_cases' => :'consented_use_cases',
        :'consented_data_scopes' => :'consented_data_scopes'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'item_id' => :'String',
        :'institution_id' => :'String',
        :'institution_name' => :'String',
        :'webhook' => :'String',
        :'auth_method' => :'ItemAuthMethod',
        :'error' => :'PlaidError',
        :'available_products' => :'Array<Products>',
        :'billed_products' => :'Array<Products>',
        :'products' => :'Array<Products>',
        :'consented_products' => :'Array<Products>',
        :'consent_expiration_time' => :'Time',
        :'update_type' => :'String',
        :'created_at' => :'Time',
        :'consented_use_cases' => :'Array<String>',
        :'consented_data_scopes' => :'Array<ItemConsentedDataScope>'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'institution_id',
        :'institution_name',
        :'webhook',
        :'auth_method',
        :'error',
        :'consent_expiration_time',
      ])
    end

    # List of class defined in allOf (OpenAPI v3)
    def self.openapi_all_of
      [
      :'Item',
      :'ItemWithConsentFieldsAllOf'
      ]
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::ItemWithConsentFields` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::ItemWithConsentFields`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'item_id')
        self.item_id = attributes[:'item_id']
      end

      if attributes.key?(:'institution_id')
        self.institution_id = attributes[:'institution_id']
      end

      if attributes.key?(:'institution_name')
        self.institution_name = attributes[:'institution_name']
      end

      if attributes.key?(:'webhook')
        self.webhook = attributes[:'webhook']
      end

      if attributes.key?(:'auth_method')
        self.auth_method = attributes[:'auth_method']
      end

      if attributes.key?(:'error')
        self.error = attributes[:'error']
      end

      if attributes.key?(:'available_products')
        if (value = attributes[:'available_products']).is_a?(Array)
          self.available_products = value
        end
      end

      if attributes.key?(:'billed_products')
        if (value = attributes[:'billed_products']).is_a?(Array)
          self.billed_products = value
        end
      end

      if attributes.key?(:'products')
        if (value = attributes[:'products']).is_a?(Array)
          self.products = value
        end
      end

      if attributes.key?(:'consented_products')
        if (value = attributes[:'consented_products']).is_a?(Array)
          self.consented_products = value
        end
      end

      if attributes.key?(:'consent_expiration_time')
        self.consent_expiration_time = attributes[:'consent_expiration_time']
      end

      if attributes.key?(:'update_type')
        self.update_type = attributes[:'update_type']
      end

      if attributes.key?(:'created_at')
        self.created_at = attributes[:'created_at']
      end

      if attributes.key?(:'consented_use_cases')
        if (value = attributes[:'consented_use_cases']).is_a?(Array)
          self.consented_use_cases = value
        end
      end

      if attributes.key?(:'consented_data_scopes')
        if (value = attributes[:'consented_data_scopes']).is_a?(Array)
          self.consented_data_scopes = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @item_id.nil?
        invalid_properties.push('invalid value for "item_id", item_id cannot be nil.')
      end

      if @available_products.nil?
        invalid_properties.push('invalid value for "available_products", available_products cannot be nil.')
      end

      if @billed_products.nil?
        invalid_properties.push('invalid value for "billed_products", billed_products cannot be nil.')
      end

      if @update_type.nil?
        invalid_properties.push('invalid value for "update_type", update_type cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @item_id.nil?
      return false if @available_products.nil?
      return false if @billed_products.nil?
      return false if @update_type.nil?
      update_type_validator = EnumAttributeValidator.new('String', ["background", "user_present_required"])
      return false unless update_type_validator.valid?(@update_type)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] update_type Object to be assigned
    def update_type=(update_type)
      validator = EnumAttributeValidator.new('String', ["background", "user_present_required"])
      unless validator.valid?(update_type)
        fail ArgumentError, "invalid value for \"update_type\", must be one of #{validator.allowable_values}."
      end
      @update_type = update_type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          item_id == o.item_id &&
          institution_id == o.institution_id &&
          institution_name == o.institution_name &&
          webhook == o.webhook &&
          auth_method == o.auth_method &&
          error == o.error &&
          available_products == o.available_products &&
          billed_products == o.billed_products &&
          products == o.products &&
          consented_products == o.consented_products &&
          consent_expiration_time == o.consent_expiration_time &&
          update_type == o.update_type &&
          created_at == o.created_at &&
          consented_use_cases == o.consented_use_cases &&
          consented_data_scopes == o.consented_data_scopes
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [item_id, institution_id, institution_name, webhook, auth_method, error, available_products, billed_products, products, consented_products, consent_expiration_time, update_type, created_at, consented_use_cases, consented_data_scopes].hash
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
