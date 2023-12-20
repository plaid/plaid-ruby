=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.482.3

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  # Fired when an Item's transactions change. This can be due to any event resulting in new changes, such as an initial 30-day transactions fetch upon the initialization of an Item with transactions, the backfill of historical transactions that occurs shortly after, or when changes are populated from a regularly-scheduled transactions update job. It is recommended to listen for the `SYNC_UPDATES_AVAILABLE` webhook when using the `/transactions/sync` endpoint. Note that when using `/transactions/sync` the older webhooks `INITIAL_UPDATE`, `HISTORICAL_UPDATE`, `DEFAULT_UPDATE`, and `TRANSACTIONS_REMOVED`, which are intended for use with `/transactions/get`, will also continue to be sent in order to maintain backwards compatibility. It is not necessary to listen for and respond to those webhooks when using `/transactions/sync`.  After receipt of this webhook, the new changes can be fetched for the Item from `/transactions/sync`.  Note that to receive this webhook for an Item, `/transactions/sync` must have been called at least once on that Item. This means that, unlike the `INITIAL_UPDATE` and `HISTORICAL_UPDATE` webhooks, it will not fire immediately upon Item creation. If `/transactions/sync` is called on an Item that was *not* initialized with Transactions, the webhook will fire twice: once the first 30 days of transactions data has been fetched, and a second time when all available historical transactions data has been fetched.  This webhook will fire in the Sandbox environment as it would in Production. It can also be manually triggered in Sandbox by calling `/sandbox/item/fire_webhook`.
  class SyncUpdatesAvailableWebhook
    # `TRANSACTIONS`
    attr_accessor :webhook_type

    # `SYNC_UPDATES_AVAILABLE`
    attr_accessor :webhook_code

    # The `item_id` of the Item associated with this webhook, warning, or error
    attr_accessor :item_id

    # Indicates if initial pull information (most recent 30 days of transaction history) is available.
    attr_accessor :initial_update_complete

    # Indicates if historical pull information (maximum transaction history requested, up to 2 years) is available.
    attr_accessor :historical_update_complete

    attr_accessor :environment

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
        :'webhook_type' => :'webhook_type',
        :'webhook_code' => :'webhook_code',
        :'item_id' => :'item_id',
        :'initial_update_complete' => :'initial_update_complete',
        :'historical_update_complete' => :'historical_update_complete',
        :'environment' => :'environment'
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
        :'item_id' => :'String',
        :'initial_update_complete' => :'Boolean',
        :'historical_update_complete' => :'Boolean',
        :'environment' => :'WebhookEnvironmentValues'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::SyncUpdatesAvailableWebhook` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::SyncUpdatesAvailableWebhook`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'webhook_type')
        self.webhook_type = attributes[:'webhook_type']
      end

      if attributes.key?(:'webhook_code')
        self.webhook_code = attributes[:'webhook_code']
      end

      if attributes.key?(:'item_id')
        self.item_id = attributes[:'item_id']
      end

      if attributes.key?(:'initial_update_complete')
        self.initial_update_complete = attributes[:'initial_update_complete']
      end

      if attributes.key?(:'historical_update_complete')
        self.historical_update_complete = attributes[:'historical_update_complete']
      end

      if attributes.key?(:'environment')
        self.environment = attributes[:'environment']
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

      if @item_id.nil?
        invalid_properties.push('invalid value for "item_id", item_id cannot be nil.')
      end

      if @initial_update_complete.nil?
        invalid_properties.push('invalid value for "initial_update_complete", initial_update_complete cannot be nil.')
      end

      if @historical_update_complete.nil?
        invalid_properties.push('invalid value for "historical_update_complete", historical_update_complete cannot be nil.')
      end

      if @environment.nil?
        invalid_properties.push('invalid value for "environment", environment cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @webhook_type.nil?
      return false if @webhook_code.nil?
      return false if @item_id.nil?
      return false if @initial_update_complete.nil?
      return false if @historical_update_complete.nil?
      return false if @environment.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          webhook_type == o.webhook_type &&
          webhook_code == o.webhook_code &&
          item_id == o.item_id &&
          initial_update_complete == o.initial_update_complete &&
          historical_update_complete == o.historical_update_complete &&
          environment == o.environment
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [webhook_type, webhook_code, item_id, initial_update_complete, historical_update_complete, environment].hash
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
