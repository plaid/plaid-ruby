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
  # Detailed information for the income source.
  class CraBankIncomeSource
    # A unique identifier for an income source.
    attr_accessor :income_source_id

    # The most common name or original description for the underlying income transactions.
    attr_accessor :income_description

    attr_accessor :income_category

    # Minimum of all dates within the specific income sources in the user's bank account for days requested by the client. The date will be returned in an ISO 8601 format (YYYY-MM-DD).
    attr_accessor :start_date

    # Maximum of all dates within the specific income sources in the user’s bank account for days requested by the client. The date will be returned in an ISO 8601 format (YYYY-MM-DD).
    attr_accessor :end_date

    attr_accessor :pay_frequency

    # Total amount of earnings in the user’s bank account for the specific income source for days requested by the client.
    attr_accessor :total_amount

    # The ISO 4217 currency code of the amount or balance.
    attr_accessor :iso_currency_code

    # The unofficial currency code associated with the amount or balance. Always `null` if `iso_currency_code` is non-null. Unofficial currency codes are used for currencies that do not have official ISO currency codes, such as cryptocurrencies and the currencies of certain countries.
    attr_accessor :unofficial_currency_code

    # Number of transactions for the income source within the start and end date.
    attr_accessor :transaction_count

    # The expected date of the end user’s next paycheck for the income source. The date will be returned in an ISO 8601 format (YYYY-MM-DD).
    attr_accessor :next_payment_date

    # An estimate of the average gross monthly income based on the historical net amount and income category for the income source(s).
    attr_accessor :historical_average_monthly_gross_income

    # The average monthly net income amount estimated based on the historical data for the income source(s).
    attr_accessor :historical_average_monthly_income

    # The predicted average monthly net income amount for the income source(s).
    attr_accessor :forecasted_average_monthly_income

    attr_accessor :employer

    attr_accessor :historical_summary

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
        :'income_source_id' => :'income_source_id',
        :'income_description' => :'income_description',
        :'income_category' => :'income_category',
        :'start_date' => :'start_date',
        :'end_date' => :'end_date',
        :'pay_frequency' => :'pay_frequency',
        :'total_amount' => :'total_amount',
        :'iso_currency_code' => :'iso_currency_code',
        :'unofficial_currency_code' => :'unofficial_currency_code',
        :'transaction_count' => :'transaction_count',
        :'next_payment_date' => :'next_payment_date',
        :'historical_average_monthly_gross_income' => :'historical_average_monthly_gross_income',
        :'historical_average_monthly_income' => :'historical_average_monthly_income',
        :'forecasted_average_monthly_income' => :'forecasted_average_monthly_income',
        :'employer' => :'employer',
        :'historical_summary' => :'historical_summary'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'income_source_id' => :'String',
        :'income_description' => :'String',
        :'income_category' => :'CreditBankIncomeCategory',
        :'start_date' => :'Date',
        :'end_date' => :'Date',
        :'pay_frequency' => :'CreditBankIncomePayFrequency',
        :'total_amount' => :'Float',
        :'iso_currency_code' => :'String',
        :'unofficial_currency_code' => :'String',
        :'transaction_count' => :'Integer',
        :'next_payment_date' => :'Date',
        :'historical_average_monthly_gross_income' => :'Float',
        :'historical_average_monthly_income' => :'Float',
        :'forecasted_average_monthly_income' => :'Float',
        :'employer' => :'CraBankIncomeEmployer',
        :'historical_summary' => :'Array<CraBankIncomeHistoricalSummary>'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'iso_currency_code',
        :'unofficial_currency_code',
        :'next_payment_date',
        :'historical_average_monthly_gross_income',
        :'historical_average_monthly_income',
        :'forecasted_average_monthly_income',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::CraBankIncomeSource` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::CraBankIncomeSource`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'income_source_id')
        self.income_source_id = attributes[:'income_source_id']
      end

      if attributes.key?(:'income_description')
        self.income_description = attributes[:'income_description']
      end

      if attributes.key?(:'income_category')
        self.income_category = attributes[:'income_category']
      end

      if attributes.key?(:'start_date')
        self.start_date = attributes[:'start_date']
      end

      if attributes.key?(:'end_date')
        self.end_date = attributes[:'end_date']
      end

      if attributes.key?(:'pay_frequency')
        self.pay_frequency = attributes[:'pay_frequency']
      end

      if attributes.key?(:'total_amount')
        self.total_amount = attributes[:'total_amount']
      end

      if attributes.key?(:'iso_currency_code')
        self.iso_currency_code = attributes[:'iso_currency_code']
      end

      if attributes.key?(:'unofficial_currency_code')
        self.unofficial_currency_code = attributes[:'unofficial_currency_code']
      end

      if attributes.key?(:'transaction_count')
        self.transaction_count = attributes[:'transaction_count']
      end

      if attributes.key?(:'next_payment_date')
        self.next_payment_date = attributes[:'next_payment_date']
      end

      if attributes.key?(:'historical_average_monthly_gross_income')
        self.historical_average_monthly_gross_income = attributes[:'historical_average_monthly_gross_income']
      end

      if attributes.key?(:'historical_average_monthly_income')
        self.historical_average_monthly_income = attributes[:'historical_average_monthly_income']
      end

      if attributes.key?(:'forecasted_average_monthly_income')
        self.forecasted_average_monthly_income = attributes[:'forecasted_average_monthly_income']
      end

      if attributes.key?(:'employer')
        self.employer = attributes[:'employer']
      end

      if attributes.key?(:'historical_summary')
        if (value = attributes[:'historical_summary']).is_a?(Array)
          self.historical_summary = value
        end
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
          income_source_id == o.income_source_id &&
          income_description == o.income_description &&
          income_category == o.income_category &&
          start_date == o.start_date &&
          end_date == o.end_date &&
          pay_frequency == o.pay_frequency &&
          total_amount == o.total_amount &&
          iso_currency_code == o.iso_currency_code &&
          unofficial_currency_code == o.unofficial_currency_code &&
          transaction_count == o.transaction_count &&
          next_payment_date == o.next_payment_date &&
          historical_average_monthly_gross_income == o.historical_average_monthly_gross_income &&
          historical_average_monthly_income == o.historical_average_monthly_income &&
          forecasted_average_monthly_income == o.forecasted_average_monthly_income &&
          employer == o.employer &&
          historical_summary == o.historical_summary
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [income_source_id, income_description, income_category, start_date, end_date, pay_frequency, total_amount, iso_currency_code, unofficial_currency_code, transaction_count, next_payment_date, historical_average_monthly_gross_income, historical_average_monthly_income, forecasted_average_monthly_income, employer, historical_summary].hash
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
