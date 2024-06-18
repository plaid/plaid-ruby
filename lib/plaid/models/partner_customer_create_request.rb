=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.525.1

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  # Request schema for `/partner/customer/create`.
  class PartnerCustomerCreateRequest
    # Your Plaid API `client_id`. The `client_id` is required and may be provided either in the `PLAID-CLIENT-ID` header or as part of a request body.
    attr_accessor :client_id

    # Your Plaid API `secret`. The `secret` is required and may be provided either in the `PLAID-SECRET` header or as part of a request body.
    attr_accessor :secret

    # The company name of the end customer being created. This will be used to display the end customer in the Plaid Dashboard. It will not be shown to end users.
    attr_accessor :company_name

    # Denotes whether or not the partner has completed attestation of diligence for the end customer to be created.
    attr_accessor :is_diligence_attested

    # The products to be enabled for the end customer. If empty or `null`, this field will default to the products enabled for the reseller at the time this endpoint is called.
    attr_accessor :products

    # If `true`, the end customer's default Link customization will be set to match the partner's. You can always change the end customer's Link customization in the Plaid Dashboard. See the [Link Customization docs](https://plaid.com/docs/link/customization/) for more information.
    attr_accessor :create_link_customization

    # Base64-encoded representation of the end customer's logo. Must be a PNG of size 1024x1024 under 4MB. The logo will be shared with financial institutions and shown to the end user during Link flows. A logo is required if `create_link_customization` is `true`. If `create_link_customization` is `false` and the logo is omitted, the partner's logo will be used if one exists, otherwise a stock logo will be used.
    attr_accessor :logo

    # The end customer's legal name. This will be shared with financial institutions as part of the OAuth registration process. It will not be shown to end users.
    attr_accessor :legal_entity_name

    # The end customer's website.
    attr_accessor :website

    # The name of the end customer's application. This will be shown to end users when they go through the Plaid Link flow.
    attr_accessor :application_name

    attr_accessor :technical_contact

    attr_accessor :billing_contact

    attr_accessor :customer_support_info

    attr_accessor :address

    # Denotes whether the partner has forwarded the Plaid bank addendum to the end customer.
    attr_accessor :is_bank_addendum_completed

    attr_accessor :assets_under_management

    # A list of URIs indicating the destination(s) where a user can be forwarded after completing the Link flow; used to support OAuth authentication flows when launching Link in the browser or another app. URIs should not contain any query parameters. When used in Production or Development, URIs must use https. To specify any subdomain, use `*` as a wildcard character, e.g. `https://*.example.com/oauth.html`. To modify redirect URIs for an end customer after creating them, go to the end customer's [API page](https://dashboard.plaid.com/team/api) in the Dashboard.
    attr_accessor :redirect_uris

    # The unique identifier assigned to a financial institution by regulatory authorities, if applicable. For banks, this is the FDIC Certificate Number. For credit unions, this is the Credit Union Charter Number.
    attr_accessor :registration_number

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'client_id' => :'client_id',
        :'secret' => :'secret',
        :'company_name' => :'company_name',
        :'is_diligence_attested' => :'is_diligence_attested',
        :'products' => :'products',
        :'create_link_customization' => :'create_link_customization',
        :'logo' => :'logo',
        :'legal_entity_name' => :'legal_entity_name',
        :'website' => :'website',
        :'application_name' => :'application_name',
        :'technical_contact' => :'technical_contact',
        :'billing_contact' => :'billing_contact',
        :'customer_support_info' => :'customer_support_info',
        :'address' => :'address',
        :'is_bank_addendum_completed' => :'is_bank_addendum_completed',
        :'assets_under_management' => :'assets_under_management',
        :'redirect_uris' => :'redirect_uris',
        :'registration_number' => :'registration_number'
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
        :'company_name' => :'String',
        :'is_diligence_attested' => :'Boolean',
        :'products' => :'Array<Products>',
        :'create_link_customization' => :'Boolean',
        :'logo' => :'String',
        :'legal_entity_name' => :'String',
        :'website' => :'String',
        :'application_name' => :'String',
        :'technical_contact' => :'PartnerEndCustomerTechnicalContact',
        :'billing_contact' => :'PartnerEndCustomerBillingContact',
        :'customer_support_info' => :'PartnerEndCustomerCustomerSupportInfo',
        :'address' => :'PartnerEndCustomerAddress',
        :'is_bank_addendum_completed' => :'Boolean',
        :'assets_under_management' => :'PartnerEndCustomerAssetsUnderManagement',
        :'redirect_uris' => :'Array<String>',
        :'registration_number' => :'String'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::PartnerCustomerCreateRequest` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::PartnerCustomerCreateRequest`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'client_id')
        self.client_id = attributes[:'client_id']
      end

      if attributes.key?(:'secret')
        self.secret = attributes[:'secret']
      end

      if attributes.key?(:'company_name')
        self.company_name = attributes[:'company_name']
      end

      if attributes.key?(:'is_diligence_attested')
        self.is_diligence_attested = attributes[:'is_diligence_attested']
      end

      if attributes.key?(:'products')
        if (value = attributes[:'products']).is_a?(Array)
          self.products = value
        end
      end

      if attributes.key?(:'create_link_customization')
        self.create_link_customization = attributes[:'create_link_customization']
      end

      if attributes.key?(:'logo')
        self.logo = attributes[:'logo']
      end

      if attributes.key?(:'legal_entity_name')
        self.legal_entity_name = attributes[:'legal_entity_name']
      end

      if attributes.key?(:'website')
        self.website = attributes[:'website']
      end

      if attributes.key?(:'application_name')
        self.application_name = attributes[:'application_name']
      end

      if attributes.key?(:'technical_contact')
        self.technical_contact = attributes[:'technical_contact']
      end

      if attributes.key?(:'billing_contact')
        self.billing_contact = attributes[:'billing_contact']
      end

      if attributes.key?(:'customer_support_info')
        self.customer_support_info = attributes[:'customer_support_info']
      end

      if attributes.key?(:'address')
        self.address = attributes[:'address']
      end

      if attributes.key?(:'is_bank_addendum_completed')
        self.is_bank_addendum_completed = attributes[:'is_bank_addendum_completed']
      end

      if attributes.key?(:'assets_under_management')
        self.assets_under_management = attributes[:'assets_under_management']
      end

      if attributes.key?(:'redirect_uris')
        if (value = attributes[:'redirect_uris']).is_a?(Array)
          self.redirect_uris = value
        end
      end

      if attributes.key?(:'registration_number')
        self.registration_number = attributes[:'registration_number']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @company_name.nil?
        invalid_properties.push('invalid value for "company_name", company_name cannot be nil.')
      end

      if @is_diligence_attested.nil?
        invalid_properties.push('invalid value for "is_diligence_attested", is_diligence_attested cannot be nil.')
      end

      if @legal_entity_name.nil?
        invalid_properties.push('invalid value for "legal_entity_name", legal_entity_name cannot be nil.')
      end

      if @website.nil?
        invalid_properties.push('invalid value for "website", website cannot be nil.')
      end

      if @application_name.nil?
        invalid_properties.push('invalid value for "application_name", application_name cannot be nil.')
      end

      if @address.nil?
        invalid_properties.push('invalid value for "address", address cannot be nil.')
      end

      if @is_bank_addendum_completed.nil?
        invalid_properties.push('invalid value for "is_bank_addendum_completed", is_bank_addendum_completed cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @company_name.nil?
      return false if @is_diligence_attested.nil?
      return false if @legal_entity_name.nil?
      return false if @website.nil?
      return false if @application_name.nil?
      return false if @address.nil?
      return false if @is_bank_addendum_completed.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          client_id == o.client_id &&
          secret == o.secret &&
          company_name == o.company_name &&
          is_diligence_attested == o.is_diligence_attested &&
          products == o.products &&
          create_link_customization == o.create_link_customization &&
          logo == o.logo &&
          legal_entity_name == o.legal_entity_name &&
          website == o.website &&
          application_name == o.application_name &&
          technical_contact == o.technical_contact &&
          billing_contact == o.billing_contact &&
          customer_support_info == o.customer_support_info &&
          address == o.address &&
          is_bank_addendum_completed == o.is_bank_addendum_completed &&
          assets_under_management == o.assets_under_management &&
          redirect_uris == o.redirect_uris &&
          registration_number == o.registration_number
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [client_id, secret, company_name, is_diligence_attested, products, create_link_customization, logo, legal_entity_name, website, application_name, technical_contact, billing_contact, customer_support_info, address, is_bank_addendum_completed, assets_under_management, redirect_uris, registration_number].hash
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
