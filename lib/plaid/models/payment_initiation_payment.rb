=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.26.1

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.1.0

=end

require 'date'
require 'time'

module Plaid
  # PaymentInitiationPayment defines a payment initiation payment
  class PaymentInitiationPayment
    # The ID of the payment. Like all Plaid identifiers, the `payment_id` is case sensitive.
    attr_accessor :payment_id

    attr_accessor :amount

    # The status of the payment.  `PAYMENT_STATUS_INPUT_NEEDED`: This is the initial state of all payments. It indicates that the payment is waiting on user input to continue processing. A payment may re-enter this state later on if further input is needed.  `PAYMENT_STATUS_PROCESSING`: The payment is currently being processed. The payment will automatically exit this state when processing is complete.  `PAYMENT_STATUS_INITIATED`: The payment has been successfully initiated and is considered complete.  `PAYMENT_STATUS_COMPLETED`: Indicates that the standing order has been successfully established. This state is only used for standing orders.  `PAYMENT_STATUS_INSUFFICIENT_FUNDS`: The payment has failed due to insufficient funds.  `PAYMENT_STATUS_FAILED`: The payment has failed to be initiated. This error is retryable once the root cause is resolved.  `PAYMENT_STATUS_BLOCKED`: The payment has been blocked. This is a retryable error.  `PAYMENT_STATUS_UNKNOWN`: The payment status is unknown.
    attr_accessor :status

    # The ID of the recipient
    attr_accessor :recipient_id

    # A reference for the payment.
    attr_accessor :reference

    # The value of the reference sent to the bank after adjustment to pass bank validation rules.
    attr_accessor :adjusted_reference

    # The date and time of the last time the `status` was updated, in IS0 8601 format
    attr_accessor :last_status_update

    attr_accessor :schedule

    attr_accessor :refund_details

    attr_accessor :bacs

    # The International Bank Account Number (IBAN) for the sender, if specified in the `/payment_initiation/payment/create` call.
    attr_accessor :iban

    # The EMI (E-Money Institution) account that this payment is associated with, if any. This EMI account is used as an intermediary account to enable Plaid to reconcile the settlement of funds for Payment Initiation requests.
    attr_accessor :emi_account_id

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
        :'payment_id' => :'payment_id',
        :'amount' => :'amount',
        :'status' => :'status',
        :'recipient_id' => :'recipient_id',
        :'reference' => :'reference',
        :'adjusted_reference' => :'adjusted_reference',
        :'last_status_update' => :'last_status_update',
        :'schedule' => :'schedule',
        :'refund_details' => :'refund_details',
        :'bacs' => :'bacs',
        :'iban' => :'iban',
        :'emi_account_id' => :'emi_account_id'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'payment_id' => :'String',
        :'amount' => :'PaymentAmount',
        :'status' => :'String',
        :'recipient_id' => :'String',
        :'reference' => :'String',
        :'adjusted_reference' => :'String',
        :'last_status_update' => :'Time',
        :'schedule' => :'ExternalPaymentScheduleGet',
        :'refund_details' => :'ExternalPaymentRefundDetails',
        :'bacs' => :'SenderBACSNullable',
        :'iban' => :'String',
        :'emi_account_id' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'adjusted_reference',
        :'schedule',
        :'refund_details',
        :'bacs',
        :'iban',
        :'emi_account_id'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::PaymentInitiationPayment` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::PaymentInitiationPayment`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'payment_id')
        self.payment_id = attributes[:'payment_id']
      end

      if attributes.key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'recipient_id')
        self.recipient_id = attributes[:'recipient_id']
      end

      if attributes.key?(:'reference')
        self.reference = attributes[:'reference']
      end

      if attributes.key?(:'adjusted_reference')
        self.adjusted_reference = attributes[:'adjusted_reference']
      end

      if attributes.key?(:'last_status_update')
        self.last_status_update = attributes[:'last_status_update']
      end

      if attributes.key?(:'schedule')
        self.schedule = attributes[:'schedule']
      end

      if attributes.key?(:'refund_details')
        self.refund_details = attributes[:'refund_details']
      end

      if attributes.key?(:'bacs')
        self.bacs = attributes[:'bacs']
      end

      if attributes.key?(:'iban')
        self.iban = attributes[:'iban']
      end

      if attributes.key?(:'emi_account_id')
        self.emi_account_id = attributes[:'emi_account_id']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @payment_id.nil?
        invalid_properties.push('invalid value for "payment_id", payment_id cannot be nil.')
      end

      if @amount.nil?
        invalid_properties.push('invalid value for "amount", amount cannot be nil.')
      end

      if @status.nil?
        invalid_properties.push('invalid value for "status", status cannot be nil.')
      end

      if @recipient_id.nil?
        invalid_properties.push('invalid value for "recipient_id", recipient_id cannot be nil.')
      end

      if @reference.nil?
        invalid_properties.push('invalid value for "reference", reference cannot be nil.')
      end

      if @last_status_update.nil?
        invalid_properties.push('invalid value for "last_status_update", last_status_update cannot be nil.')
      end

      if !@emi_account_id.nil? && @emi_account_id.to_s.length < 1
        invalid_properties.push('invalid value for "emi_account_id", the character length must be great than or equal to 1.')
      end


      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @payment_id.nil?
      return false if @amount.nil?
      return false if @status.nil?
      status_validator = EnumAttributeValidator.new('String', ["PAYMENT_STATUS_INPUT_NEEDED", "PAYMENT_STATUS_PROCESSING", "PAYMENT_STATUS_INITIATED", "PAYMENT_STATUS_COMPLETED", "PAYMENT_STATUS_INSUFFICIENT_FUNDS", "PAYMENT_STATUS_FAILED", "PAYMENT_STATUS_BLOCKED", "PAYMENT_STATUS_UNKNOWN"])
      return false unless status_validator.valid?(@status)
      return false if @recipient_id.nil?
      return false if @reference.nil?
      return false if @last_status_update.nil?
      return false if !@emi_account_id.nil? && @emi_account_id.to_s.length < 1
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      validator = EnumAttributeValidator.new('String', ["PAYMENT_STATUS_INPUT_NEEDED", "PAYMENT_STATUS_PROCESSING", "PAYMENT_STATUS_INITIATED", "PAYMENT_STATUS_COMPLETED", "PAYMENT_STATUS_INSUFFICIENT_FUNDS", "PAYMENT_STATUS_FAILED", "PAYMENT_STATUS_BLOCKED", "PAYMENT_STATUS_UNKNOWN"])
      unless validator.valid?(status)
        fail ArgumentError, "invalid value for \"status\", must be one of #{validator.allowable_values}."
      end
      @status = status
    end

    # Custom attribute writer method with validation
    # @param [Object] emi_account_id Value to be assigned
    def emi_account_id=(emi_account_id)
      if !emi_account_id.nil? && emi_account_id.to_s.length < 1
        fail ArgumentError, 'invalid value for "emi_account_id", the character length must be great than or equal to 1.'
      end


      @emi_account_id = emi_account_id
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          payment_id == o.payment_id &&
          amount == o.amount &&
          status == o.status &&
          recipient_id == o.recipient_id &&
          reference == o.reference &&
          adjusted_reference == o.adjusted_reference &&
          last_status_update == o.last_status_update &&
          schedule == o.schedule &&
          refund_details == o.refund_details &&
          bacs == o.bacs &&
          iban == o.iban &&
          emi_account_id == o.emi_account_id
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [payment_id, amount, status, recipient_id, reference, adjusted_reference, last_status_update, schedule, refund_details, bacs, iban, emi_account_id].hash
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
