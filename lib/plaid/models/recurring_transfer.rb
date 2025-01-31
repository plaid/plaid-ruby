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
  # Represents a recurring transfer within the Transfers API.
  class RecurringTransfer
    # Plaid’s unique identifier for a recurring transfer.
    attr_accessor :recurring_transfer_id

    # The datetime when this transfer was created. This will be of the form `2006-01-02T15:04:05Z`
    attr_accessor :created

    # A date in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).  The next transfer origination date after bank holiday adjustment.
    attr_accessor :next_origination_date

    # Plaid’s unique identifier for a test clock.
    attr_accessor :test_clock_id

    attr_accessor :type

    # The amount of the transfer (decimal string with two digits of precision e.g. \"10.00\"). When calling `/transfer/authorization/create`, specify the maximum amount to authorize. When calling `/transfer/create`, specify the exact amount of the transfer, up to a maximum of the amount authorized. If this field is left blank when calling `/transfer/create`, the maximum amount authorized in the `authorization_id` will be sent.
    attr_accessor :amount

    attr_accessor :status

    attr_accessor :ach_class

    attr_accessor :network

    # Plaid’s unique identifier for the origination account that was used for this transfer.
    attr_accessor :origination_account_id

    # The Plaid `account_id` corresponding to the end-user account that will be debited or credited.
    attr_accessor :account_id

    # The id of the funding account to use, available in the Plaid Dashboard. This determines which of your business checking accounts will be credited or debited.
    attr_accessor :funding_account_id

    # The currency of the transfer amount, e.g. \"USD\"
    attr_accessor :iso_currency_code

    # The description of the recurring transfer.
    attr_accessor :description

    attr_accessor :transfer_ids

    attr_accessor :user

    attr_accessor :schedule

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
        :'recurring_transfer_id' => :'recurring_transfer_id',
        :'created' => :'created',
        :'next_origination_date' => :'next_origination_date',
        :'test_clock_id' => :'test_clock_id',
        :'type' => :'type',
        :'amount' => :'amount',
        :'status' => :'status',
        :'ach_class' => :'ach_class',
        :'network' => :'network',
        :'origination_account_id' => :'origination_account_id',
        :'account_id' => :'account_id',
        :'funding_account_id' => :'funding_account_id',
        :'iso_currency_code' => :'iso_currency_code',
        :'description' => :'description',
        :'transfer_ids' => :'transfer_ids',
        :'user' => :'user',
        :'schedule' => :'schedule'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'recurring_transfer_id' => :'String',
        :'created' => :'Time',
        :'next_origination_date' => :'Date',
        :'test_clock_id' => :'String',
        :'type' => :'TransferType',
        :'amount' => :'String',
        :'status' => :'TransferRecurringStatus',
        :'ach_class' => :'ACHClass',
        :'network' => :'TransferRecurringNetwork',
        :'origination_account_id' => :'String',
        :'account_id' => :'String',
        :'funding_account_id' => :'String',
        :'iso_currency_code' => :'String',
        :'description' => :'String',
        :'transfer_ids' => :'Array<String>',
        :'user' => :'TransferUserInResponse',
        :'schedule' => :'TransferRecurringSchedule'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'next_origination_date',
        :'test_clock_id',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::RecurringTransfer` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::RecurringTransfer`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'recurring_transfer_id')
        self.recurring_transfer_id = attributes[:'recurring_transfer_id']
      end

      if attributes.key?(:'created')
        self.created = attributes[:'created']
      end

      if attributes.key?(:'next_origination_date')
        self.next_origination_date = attributes[:'next_origination_date']
      end

      if attributes.key?(:'test_clock_id')
        self.test_clock_id = attributes[:'test_clock_id']
      end

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'ach_class')
        self.ach_class = attributes[:'ach_class']
      end

      if attributes.key?(:'network')
        self.network = attributes[:'network']
      end

      if attributes.key?(:'origination_account_id')
        self.origination_account_id = attributes[:'origination_account_id']
      end

      if attributes.key?(:'account_id')
        self.account_id = attributes[:'account_id']
      end

      if attributes.key?(:'funding_account_id')
        self.funding_account_id = attributes[:'funding_account_id']
      end

      if attributes.key?(:'iso_currency_code')
        self.iso_currency_code = attributes[:'iso_currency_code']
      end

      if attributes.key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.key?(:'transfer_ids')
        if (value = attributes[:'transfer_ids']).is_a?(Array)
          self.transfer_ids = value
        end
      end

      if attributes.key?(:'user')
        self.user = attributes[:'user']
      end

      if attributes.key?(:'schedule')
        self.schedule = attributes[:'schedule']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @recurring_transfer_id.nil?
        invalid_properties.push('invalid value for "recurring_transfer_id", recurring_transfer_id cannot be nil.')
      end

      if @created.nil?
        invalid_properties.push('invalid value for "created", created cannot be nil.')
      end

      if @type.nil?
        invalid_properties.push('invalid value for "type", type cannot be nil.')
      end

      if @amount.nil?
        invalid_properties.push('invalid value for "amount", amount cannot be nil.')
      end

      if @status.nil?
        invalid_properties.push('invalid value for "status", status cannot be nil.')
      end

      if @network.nil?
        invalid_properties.push('invalid value for "network", network cannot be nil.')
      end

      if @origination_account_id.nil?
        invalid_properties.push('invalid value for "origination_account_id", origination_account_id cannot be nil.')
      end

      if @account_id.nil?
        invalid_properties.push('invalid value for "account_id", account_id cannot be nil.')
      end

      if @funding_account_id.nil?
        invalid_properties.push('invalid value for "funding_account_id", funding_account_id cannot be nil.')
      end

      if @iso_currency_code.nil?
        invalid_properties.push('invalid value for "iso_currency_code", iso_currency_code cannot be nil.')
      end

      if @description.nil?
        invalid_properties.push('invalid value for "description", description cannot be nil.')
      end

      if @transfer_ids.nil?
        invalid_properties.push('invalid value for "transfer_ids", transfer_ids cannot be nil.')
      end

      if @user.nil?
        invalid_properties.push('invalid value for "user", user cannot be nil.')
      end

      if @schedule.nil?
        invalid_properties.push('invalid value for "schedule", schedule cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @recurring_transfer_id.nil?
      return false if @created.nil?
      return false if @type.nil?
      return false if @amount.nil?
      return false if @status.nil?
      return false if @network.nil?
      return false if @origination_account_id.nil?
      return false if @account_id.nil?
      return false if @funding_account_id.nil?
      return false if @iso_currency_code.nil?
      return false if @description.nil?
      return false if @transfer_ids.nil?
      return false if @user.nil?
      return false if @schedule.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          recurring_transfer_id == o.recurring_transfer_id &&
          created == o.created &&
          next_origination_date == o.next_origination_date &&
          test_clock_id == o.test_clock_id &&
          type == o.type &&
          amount == o.amount &&
          status == o.status &&
          ach_class == o.ach_class &&
          network == o.network &&
          origination_account_id == o.origination_account_id &&
          account_id == o.account_id &&
          funding_account_id == o.funding_account_id &&
          iso_currency_code == o.iso_currency_code &&
          description == o.description &&
          transfer_ids == o.transfer_ids &&
          user == o.user &&
          schedule == o.schedule
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [recurring_transfer_id, created, next_origination_date, test_clock_id, type, amount, status, ach_class, network, origination_account_id, account_id, funding_account_id, iso_currency_code, description, transfer_ids, user, schedule].hash
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
