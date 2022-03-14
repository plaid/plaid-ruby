=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.84.5

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.1.0

=end

require 'date'
require 'time'

module Plaid
  # Fired when the status of a payment has changed.
  class PaymentStatusUpdateWebhook
    # `PAYMENT_INITIATION`
    attr_accessor :webhook_type

    # `PAYMENT_STATUS_UPDATE`
    attr_accessor :webhook_code

    # The `payment_id` for the payment being updated
    attr_accessor :payment_id

    attr_accessor :new_payment_status

    attr_accessor :old_payment_status

    # The original value of the reference when creating the payment.
    attr_accessor :original_reference

    # The value of the reference sent to the bank after adjustment to pass bank validation rules.
    attr_accessor :adjusted_reference

    # The original value of the `start_date` provided during the creation of a standing order. If the payment is not a standing order, this field will be `null`.
    attr_accessor :original_start_date

    # The start date sent to the bank after adjusting for holidays or weekends.  Will be provided in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD). If the start date did not require adjustment, or if the payment is not a standing order, this field will be `null`.
    attr_accessor :adjusted_start_date

    # The timestamp of the update, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format, e.g. `\"2017-09-14T14:42:19.350Z\"`
    attr_accessor :timestamp

    attr_accessor :error

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'webhook_type' => :'webhook_type',
        :'webhook_code' => :'webhook_code',
        :'payment_id' => :'payment_id',
        :'new_payment_status' => :'new_payment_status',
        :'old_payment_status' => :'old_payment_status',
        :'original_reference' => :'original_reference',
        :'adjusted_reference' => :'adjusted_reference',
        :'original_start_date' => :'original_start_date',
        :'adjusted_start_date' => :'adjusted_start_date',
        :'timestamp' => :'timestamp',
        :'error' => :'error'
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
        :'payment_id' => :'String',
        :'new_payment_status' => :'PaymentInitiationPaymentStatus',
        :'old_payment_status' => :'PaymentInitiationPaymentStatus',
        :'original_reference' => :'String',
        :'adjusted_reference' => :'String',
        :'original_start_date' => :'Date',
        :'adjusted_start_date' => :'Date',
        :'timestamp' => :'Time',
        :'error' => :'PlaidError'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'original_reference',
        :'adjusted_reference',
        :'original_start_date',
        :'adjusted_start_date',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::PaymentStatusUpdateWebhook` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::PaymentStatusUpdateWebhook`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'webhook_type')
        self.webhook_type = attributes[:'webhook_type']
      end

      if attributes.key?(:'webhook_code')
        self.webhook_code = attributes[:'webhook_code']
      end

      if attributes.key?(:'payment_id')
        self.payment_id = attributes[:'payment_id']
      end

      if attributes.key?(:'new_payment_status')
        self.new_payment_status = attributes[:'new_payment_status']
      end

      if attributes.key?(:'old_payment_status')
        self.old_payment_status = attributes[:'old_payment_status']
      end

      if attributes.key?(:'original_reference')
        self.original_reference = attributes[:'original_reference']
      end

      if attributes.key?(:'adjusted_reference')
        self.adjusted_reference = attributes[:'adjusted_reference']
      end

      if attributes.key?(:'original_start_date')
        self.original_start_date = attributes[:'original_start_date']
      end

      if attributes.key?(:'adjusted_start_date')
        self.adjusted_start_date = attributes[:'adjusted_start_date']
      end

      if attributes.key?(:'timestamp')
        self.timestamp = attributes[:'timestamp']
      end

      if attributes.key?(:'error')
        self.error = attributes[:'error']
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

      if @payment_id.nil?
        invalid_properties.push('invalid value for "payment_id", payment_id cannot be nil.')
      end

      if @new_payment_status.nil?
        invalid_properties.push('invalid value for "new_payment_status", new_payment_status cannot be nil.')
      end

      if @old_payment_status.nil?
        invalid_properties.push('invalid value for "old_payment_status", old_payment_status cannot be nil.')
      end

      if @timestamp.nil?
        invalid_properties.push('invalid value for "timestamp", timestamp cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @webhook_type.nil?
      return false if @webhook_code.nil?
      return false if @payment_id.nil?
      return false if @new_payment_status.nil?
      return false if @old_payment_status.nil?
      return false if @timestamp.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          webhook_type == o.webhook_type &&
          webhook_code == o.webhook_code &&
          payment_id == o.payment_id &&
          new_payment_status == o.new_payment_status &&
          old_payment_status == o.old_payment_status &&
          original_reference == o.original_reference &&
          adjusted_reference == o.adjusted_reference &&
          original_start_date == o.original_start_date &&
          adjusted_start_date == o.adjusted_start_date &&
          timestamp == o.timestamp &&
          error == o.error
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [webhook_type, webhook_code, payment_id, new_payment_status, old_payment_status, original_reference, adjusted_reference, original_start_date, adjusted_start_date, timestamp, error].hash
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
