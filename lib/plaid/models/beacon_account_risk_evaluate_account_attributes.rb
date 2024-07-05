=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.534.3

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  # The attributes object contains data that can be used to assess account risk. Examples of data include: `days_since_first_plaid_connection`: The number of days since the first time the Item was connected to an application via Plaid `plaid_connections_count_7d`: The number of times the Item has been connected to applications via Plaid over the past 7 days `plaid_connections_count_30d`: The number of times the Item has been connected to applications via Plaid over the past 30 days `total_plaid_connections_count`: The number of times the Item has been connected to applications via Plaid For the full list and detailed documentation of core attributes available, or to request that core attributes not be returned, contact Sales or your Plaid account manager
  class BeaconAccountRiskEvaluateAccountAttributes
    # The number of days since the first time the Item was connected to an application via Plaid
    attr_accessor :days_since_first_plaid_connection

    # Indicates if the account has been closed by the financial institution or the consumer, or is at risk of being closed
    attr_accessor :is_account_closed

    # Indicates whether the account has withdrawals and transfers disabled or if access to the account is restricted. This could be due to a freeze by the credit issuer, legal restrictions (e.g., sanctions), or regulatory requirements limiting monthly withdrawals, among other reasons
    attr_accessor :is_account_frozen_or_restricted

    # The total number of times the item has been connected to applications via Plaid
    attr_accessor :total_plaid_connections_count

    # The number of times the Item has been connected to applications via Plaid over the past 7 days
    attr_accessor :plaid_connections_count_7d

    # The number of times the Item has been connected to applications via Plaid over the past 30 days
    attr_accessor :plaid_connections_count_30d

    # The number of failed non-OAuth authentication attempts via Plaid for this bank account over the past 3 days
    attr_accessor :failed_plaid_non_oauth_authentication_attempts_count_3d

    # The number of non-OAuth authentication attempts via Plaid for this bank account over the past 3 days
    attr_accessor :plaid_non_oauth_authentication_attempts_count_3d

    # The number of failed non-OAuth authentication attempts via Plaid for this bank account over the past 7 days
    attr_accessor :failed_plaid_non_oauth_authentication_attempts_count_7d

    # The number of non-OAuth authentication attempts via Plaid for this bank account over the past 7 days
    attr_accessor :plaid_non_oauth_authentication_attempts_count_7d

    # The number of failed non-OAuth authentication attempts via Plaid for this bank account over the past 30 days
    attr_accessor :failed_plaid_non_oauth_authentication_attempts_count_30d

    # The number of non-OAuth authentication attempts via Plaid for this bank account over the past 30 days
    attr_accessor :plaid_non_oauth_authentication_attempts_count_30d

    # The number of distinct IP addresses linked to the same bank account during Plaid authentication in the last 3 days
    attr_accessor :distinct_ip_addresses_count_3d

    # The number of distinct IP addresses linked to the same bank account during Plaid authentication in the last 7 days
    attr_accessor :distinct_ip_addresses_count_7d

    # The number of distinct IP addresses linked to the same bank account during Plaid authentication in the last 30 days
    attr_accessor :distinct_ip_addresses_count_30d

    # The number of distinct IP addresses linked to the same bank account during Plaid authentication in the last 90 days
    attr_accessor :distinct_ip_addresses_count_90d

    # The number of distinct user agents linked to the same bank account during Plaid authentication in the last 3 days
    attr_accessor :distinct_user_agents_count_3d

    # The number of distinct user agents linked to the same bank account during Plaid authentication in the last 7 days
    attr_accessor :distinct_user_agents_count_7d

    # The number of distinct user agents linked to the same bank account during Plaid authentication in the last 30 days
    attr_accessor :distinct_user_agents_count_30d

    # The number of distinct user agents linked to the same bank account during Plaid authentication in the last 90 days
    attr_accessor :distinct_user_agents_count_90d

    # The number of times the account's addresses on file have changed over the past 28 days
    attr_accessor :address_change_count_28d

    # The number of times the account's email addresses on file have changed over the past 28 days
    attr_accessor :email_change_count_28d

    # The number of times the account's phone numbers on file have changed over the past 28 days
    attr_accessor :phone_change_count_28d

    # The number of times the account's addresses on file have changed over the past 90 days
    attr_accessor :address_change_count_90d

    # The number of times the account's email addresses on file have changed over the past 90 days
    attr_accessor :email_change_count_90d

    # The number of times the account's phone numbers on file have changed over the past 90 days
    attr_accessor :phone_change_count_90d

    # The number of days since the bank account was opened, as reported by the financial institution
    attr_accessor :days_since_account_opening

    # The number of days since the oldest transaction available to Plaid for this account. This measure, combined with Plaid connection history, can be used to infer the age of the account
    attr_accessor :days_since_first_observed_transaction

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'days_since_first_plaid_connection' => :'days_since_first_plaid_connection',
        :'is_account_closed' => :'is_account_closed',
        :'is_account_frozen_or_restricted' => :'is_account_frozen_or_restricted',
        :'total_plaid_connections_count' => :'total_plaid_connections_count',
        :'plaid_connections_count_7d' => :'plaid_connections_count_7d',
        :'plaid_connections_count_30d' => :'plaid_connections_count_30d',
        :'failed_plaid_non_oauth_authentication_attempts_count_3d' => :'failed_plaid_non_oauth_authentication_attempts_count_3d',
        :'plaid_non_oauth_authentication_attempts_count_3d' => :'plaid_non_oauth_authentication_attempts_count_3d',
        :'failed_plaid_non_oauth_authentication_attempts_count_7d' => :'failed_plaid_non_oauth_authentication_attempts_count_7d',
        :'plaid_non_oauth_authentication_attempts_count_7d' => :'plaid_non_oauth_authentication_attempts_count_7d',
        :'failed_plaid_non_oauth_authentication_attempts_count_30d' => :'failed_plaid_non_oauth_authentication_attempts_count_30d',
        :'plaid_non_oauth_authentication_attempts_count_30d' => :'plaid_non_oauth_authentication_attempts_count_30d',
        :'distinct_ip_addresses_count_3d' => :'distinct_ip_addresses_count_3d',
        :'distinct_ip_addresses_count_7d' => :'distinct_ip_addresses_count_7d',
        :'distinct_ip_addresses_count_30d' => :'distinct_ip_addresses_count_30d',
        :'distinct_ip_addresses_count_90d' => :'distinct_ip_addresses_count_90d',
        :'distinct_user_agents_count_3d' => :'distinct_user_agents_count_3d',
        :'distinct_user_agents_count_7d' => :'distinct_user_agents_count_7d',
        :'distinct_user_agents_count_30d' => :'distinct_user_agents_count_30d',
        :'distinct_user_agents_count_90d' => :'distinct_user_agents_count_90d',
        :'address_change_count_28d' => :'address_change_count_28d',
        :'email_change_count_28d' => :'email_change_count_28d',
        :'phone_change_count_28d' => :'phone_change_count_28d',
        :'address_change_count_90d' => :'address_change_count_90d',
        :'email_change_count_90d' => :'email_change_count_90d',
        :'phone_change_count_90d' => :'phone_change_count_90d',
        :'days_since_account_opening' => :'days_since_account_opening',
        :'days_since_first_observed_transaction' => :'days_since_first_observed_transaction'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'days_since_first_plaid_connection' => :'Integer',
        :'is_account_closed' => :'Boolean',
        :'is_account_frozen_or_restricted' => :'Boolean',
        :'total_plaid_connections_count' => :'Integer',
        :'plaid_connections_count_7d' => :'Integer',
        :'plaid_connections_count_30d' => :'Integer',
        :'failed_plaid_non_oauth_authentication_attempts_count_3d' => :'Integer',
        :'plaid_non_oauth_authentication_attempts_count_3d' => :'Integer',
        :'failed_plaid_non_oauth_authentication_attempts_count_7d' => :'Integer',
        :'plaid_non_oauth_authentication_attempts_count_7d' => :'Integer',
        :'failed_plaid_non_oauth_authentication_attempts_count_30d' => :'Integer',
        :'plaid_non_oauth_authentication_attempts_count_30d' => :'Integer',
        :'distinct_ip_addresses_count_3d' => :'Integer',
        :'distinct_ip_addresses_count_7d' => :'Integer',
        :'distinct_ip_addresses_count_30d' => :'Integer',
        :'distinct_ip_addresses_count_90d' => :'Integer',
        :'distinct_user_agents_count_3d' => :'Integer',
        :'distinct_user_agents_count_7d' => :'Integer',
        :'distinct_user_agents_count_30d' => :'Integer',
        :'distinct_user_agents_count_90d' => :'Integer',
        :'address_change_count_28d' => :'Integer',
        :'email_change_count_28d' => :'Integer',
        :'phone_change_count_28d' => :'Integer',
        :'address_change_count_90d' => :'Integer',
        :'email_change_count_90d' => :'Integer',
        :'phone_change_count_90d' => :'Integer',
        :'days_since_account_opening' => :'Integer',
        :'days_since_first_observed_transaction' => :'Integer'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'days_since_first_plaid_connection',
        :'is_account_closed',
        :'is_account_frozen_or_restricted',
        :'total_plaid_connections_count',
        :'plaid_connections_count_7d',
        :'plaid_connections_count_30d',
        :'failed_plaid_non_oauth_authentication_attempts_count_3d',
        :'plaid_non_oauth_authentication_attempts_count_3d',
        :'failed_plaid_non_oauth_authentication_attempts_count_7d',
        :'plaid_non_oauth_authentication_attempts_count_7d',
        :'failed_plaid_non_oauth_authentication_attempts_count_30d',
        :'plaid_non_oauth_authentication_attempts_count_30d',
        :'distinct_ip_addresses_count_3d',
        :'distinct_ip_addresses_count_7d',
        :'distinct_ip_addresses_count_30d',
        :'distinct_ip_addresses_count_90d',
        :'distinct_user_agents_count_3d',
        :'distinct_user_agents_count_7d',
        :'distinct_user_agents_count_30d',
        :'distinct_user_agents_count_90d',
        :'address_change_count_28d',
        :'email_change_count_28d',
        :'phone_change_count_28d',
        :'address_change_count_90d',
        :'email_change_count_90d',
        :'phone_change_count_90d',
        :'days_since_account_opening',
        :'days_since_first_observed_transaction'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::BeaconAccountRiskEvaluateAccountAttributes` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::BeaconAccountRiskEvaluateAccountAttributes`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'days_since_first_plaid_connection')
        self.days_since_first_plaid_connection = attributes[:'days_since_first_plaid_connection']
      end

      if attributes.key?(:'is_account_closed')
        self.is_account_closed = attributes[:'is_account_closed']
      end

      if attributes.key?(:'is_account_frozen_or_restricted')
        self.is_account_frozen_or_restricted = attributes[:'is_account_frozen_or_restricted']
      end

      if attributes.key?(:'total_plaid_connections_count')
        self.total_plaid_connections_count = attributes[:'total_plaid_connections_count']
      end

      if attributes.key?(:'plaid_connections_count_7d')
        self.plaid_connections_count_7d = attributes[:'plaid_connections_count_7d']
      end

      if attributes.key?(:'plaid_connections_count_30d')
        self.plaid_connections_count_30d = attributes[:'plaid_connections_count_30d']
      end

      if attributes.key?(:'failed_plaid_non_oauth_authentication_attempts_count_3d')
        self.failed_plaid_non_oauth_authentication_attempts_count_3d = attributes[:'failed_plaid_non_oauth_authentication_attempts_count_3d']
      end

      if attributes.key?(:'plaid_non_oauth_authentication_attempts_count_3d')
        self.plaid_non_oauth_authentication_attempts_count_3d = attributes[:'plaid_non_oauth_authentication_attempts_count_3d']
      end

      if attributes.key?(:'failed_plaid_non_oauth_authentication_attempts_count_7d')
        self.failed_plaid_non_oauth_authentication_attempts_count_7d = attributes[:'failed_plaid_non_oauth_authentication_attempts_count_7d']
      end

      if attributes.key?(:'plaid_non_oauth_authentication_attempts_count_7d')
        self.plaid_non_oauth_authentication_attempts_count_7d = attributes[:'plaid_non_oauth_authentication_attempts_count_7d']
      end

      if attributes.key?(:'failed_plaid_non_oauth_authentication_attempts_count_30d')
        self.failed_plaid_non_oauth_authentication_attempts_count_30d = attributes[:'failed_plaid_non_oauth_authentication_attempts_count_30d']
      end

      if attributes.key?(:'plaid_non_oauth_authentication_attempts_count_30d')
        self.plaid_non_oauth_authentication_attempts_count_30d = attributes[:'plaid_non_oauth_authentication_attempts_count_30d']
      end

      if attributes.key?(:'distinct_ip_addresses_count_3d')
        self.distinct_ip_addresses_count_3d = attributes[:'distinct_ip_addresses_count_3d']
      end

      if attributes.key?(:'distinct_ip_addresses_count_7d')
        self.distinct_ip_addresses_count_7d = attributes[:'distinct_ip_addresses_count_7d']
      end

      if attributes.key?(:'distinct_ip_addresses_count_30d')
        self.distinct_ip_addresses_count_30d = attributes[:'distinct_ip_addresses_count_30d']
      end

      if attributes.key?(:'distinct_ip_addresses_count_90d')
        self.distinct_ip_addresses_count_90d = attributes[:'distinct_ip_addresses_count_90d']
      end

      if attributes.key?(:'distinct_user_agents_count_3d')
        self.distinct_user_agents_count_3d = attributes[:'distinct_user_agents_count_3d']
      end

      if attributes.key?(:'distinct_user_agents_count_7d')
        self.distinct_user_agents_count_7d = attributes[:'distinct_user_agents_count_7d']
      end

      if attributes.key?(:'distinct_user_agents_count_30d')
        self.distinct_user_agents_count_30d = attributes[:'distinct_user_agents_count_30d']
      end

      if attributes.key?(:'distinct_user_agents_count_90d')
        self.distinct_user_agents_count_90d = attributes[:'distinct_user_agents_count_90d']
      end

      if attributes.key?(:'address_change_count_28d')
        self.address_change_count_28d = attributes[:'address_change_count_28d']
      end

      if attributes.key?(:'email_change_count_28d')
        self.email_change_count_28d = attributes[:'email_change_count_28d']
      end

      if attributes.key?(:'phone_change_count_28d')
        self.phone_change_count_28d = attributes[:'phone_change_count_28d']
      end

      if attributes.key?(:'address_change_count_90d')
        self.address_change_count_90d = attributes[:'address_change_count_90d']
      end

      if attributes.key?(:'email_change_count_90d')
        self.email_change_count_90d = attributes[:'email_change_count_90d']
      end

      if attributes.key?(:'phone_change_count_90d')
        self.phone_change_count_90d = attributes[:'phone_change_count_90d']
      end

      if attributes.key?(:'days_since_account_opening')
        self.days_since_account_opening = attributes[:'days_since_account_opening']
      end

      if attributes.key?(:'days_since_first_observed_transaction')
        self.days_since_first_observed_transaction = attributes[:'days_since_first_observed_transaction']
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
          days_since_first_plaid_connection == o.days_since_first_plaid_connection &&
          is_account_closed == o.is_account_closed &&
          is_account_frozen_or_restricted == o.is_account_frozen_or_restricted &&
          total_plaid_connections_count == o.total_plaid_connections_count &&
          plaid_connections_count_7d == o.plaid_connections_count_7d &&
          plaid_connections_count_30d == o.plaid_connections_count_30d &&
          failed_plaid_non_oauth_authentication_attempts_count_3d == o.failed_plaid_non_oauth_authentication_attempts_count_3d &&
          plaid_non_oauth_authentication_attempts_count_3d == o.plaid_non_oauth_authentication_attempts_count_3d &&
          failed_plaid_non_oauth_authentication_attempts_count_7d == o.failed_plaid_non_oauth_authentication_attempts_count_7d &&
          plaid_non_oauth_authentication_attempts_count_7d == o.plaid_non_oauth_authentication_attempts_count_7d &&
          failed_plaid_non_oauth_authentication_attempts_count_30d == o.failed_plaid_non_oauth_authentication_attempts_count_30d &&
          plaid_non_oauth_authentication_attempts_count_30d == o.plaid_non_oauth_authentication_attempts_count_30d &&
          distinct_ip_addresses_count_3d == o.distinct_ip_addresses_count_3d &&
          distinct_ip_addresses_count_7d == o.distinct_ip_addresses_count_7d &&
          distinct_ip_addresses_count_30d == o.distinct_ip_addresses_count_30d &&
          distinct_ip_addresses_count_90d == o.distinct_ip_addresses_count_90d &&
          distinct_user_agents_count_3d == o.distinct_user_agents_count_3d &&
          distinct_user_agents_count_7d == o.distinct_user_agents_count_7d &&
          distinct_user_agents_count_30d == o.distinct_user_agents_count_30d &&
          distinct_user_agents_count_90d == o.distinct_user_agents_count_90d &&
          address_change_count_28d == o.address_change_count_28d &&
          email_change_count_28d == o.email_change_count_28d &&
          phone_change_count_28d == o.phone_change_count_28d &&
          address_change_count_90d == o.address_change_count_90d &&
          email_change_count_90d == o.email_change_count_90d &&
          phone_change_count_90d == o.phone_change_count_90d &&
          days_since_account_opening == o.days_since_account_opening &&
          days_since_first_observed_transaction == o.days_since_first_observed_transaction
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [days_since_first_plaid_connection, is_account_closed, is_account_frozen_or_restricted, total_plaid_connections_count, plaid_connections_count_7d, plaid_connections_count_30d, failed_plaid_non_oauth_authentication_attempts_count_3d, plaid_non_oauth_authentication_attempts_count_3d, failed_plaid_non_oauth_authentication_attempts_count_7d, plaid_non_oauth_authentication_attempts_count_7d, failed_plaid_non_oauth_authentication_attempts_count_30d, plaid_non_oauth_authentication_attempts_count_30d, distinct_ip_addresses_count_3d, distinct_ip_addresses_count_7d, distinct_ip_addresses_count_30d, distinct_ip_addresses_count_90d, distinct_user_agents_count_3d, distinct_user_agents_count_7d, distinct_user_agents_count_30d, distinct_user_agents_count_90d, address_change_count_28d, email_change_count_28d, phone_change_count_28d, address_change_count_90d, email_change_count_90d, phone_change_count_90d, days_since_account_opening, days_since_first_observed_transaction].hash
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
