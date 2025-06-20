=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.645.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  # Summary for income across all income sources and items (max history of 730 days).
  class CraBankIncomeSummary
    # Total amount of earnings across all the income sources in the end user's Items for the days requested by the client. This can contain multiple amounts, with each amount denominated in one unique currency.
    attr_accessor :total_amounts

    # The earliest date within the days requested in which all income sources identified by Plaid appear in a user's account. The date will be returned in an ISO 8601 format (YYYY-MM-DD).
    attr_accessor :start_date

    # The latest date in which all income sources identified by Plaid appear in the user's account. The date will be returned in an ISO 8601 format (YYYY-MM-DD).
    attr_accessor :end_date

    # Number of income sources per end user.
    attr_accessor :income_sources_count

    # Number of income categories per end user.
    attr_accessor :income_categories_count

    # Number of income transactions per end user.
    attr_accessor :income_transactions_count

    # An estimate of the average gross monthly income based on the historical net amount and income category for the income source(s).
    attr_accessor :historical_average_monthly_gross_income

    # The average monthly income amount estimated based on the historical data for the income source(s).
    attr_accessor :historical_average_monthly_income

    # The predicted average monthly income amount for the income source(s).
    attr_accessor :forecasted_average_monthly_income

    # An estimate of the annual gross income based on the historical net amount and income category for the income source(s).
    attr_accessor :historical_annual_gross_income

    # The annual income amount estimated based on the historical data for the income source(s).
    attr_accessor :historical_annual_income

    # The predicted average annual income amount for the income source(s).
    attr_accessor :forecasted_annual_income

    attr_accessor :historical_summary

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'total_amounts' => :'total_amounts',
        :'start_date' => :'start_date',
        :'end_date' => :'end_date',
        :'income_sources_count' => :'income_sources_count',
        :'income_categories_count' => :'income_categories_count',
        :'income_transactions_count' => :'income_transactions_count',
        :'historical_average_monthly_gross_income' => :'historical_average_monthly_gross_income',
        :'historical_average_monthly_income' => :'historical_average_monthly_income',
        :'forecasted_average_monthly_income' => :'forecasted_average_monthly_income',
        :'historical_annual_gross_income' => :'historical_annual_gross_income',
        :'historical_annual_income' => :'historical_annual_income',
        :'forecasted_annual_income' => :'forecasted_annual_income',
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
        :'total_amounts' => :'Array<CreditAmountWithCurrency>',
        :'start_date' => :'Date',
        :'end_date' => :'Date',
        :'income_sources_count' => :'Integer',
        :'income_categories_count' => :'Integer',
        :'income_transactions_count' => :'Integer',
        :'historical_average_monthly_gross_income' => :'Array<CreditAmountWithCurrency>',
        :'historical_average_monthly_income' => :'Array<CreditAmountWithCurrency>',
        :'forecasted_average_monthly_income' => :'Array<CreditAmountWithCurrency>',
        :'historical_annual_gross_income' => :'Array<CreditAmountWithCurrency>',
        :'historical_annual_income' => :'Array<CreditAmountWithCurrency>',
        :'forecasted_annual_income' => :'Array<CreditAmountWithCurrency>',
        :'historical_summary' => :'Array<CraBankIncomeHistoricalSummary>'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::CraBankIncomeSummary` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::CraBankIncomeSummary`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'total_amounts')
        if (value = attributes[:'total_amounts']).is_a?(Array)
          self.total_amounts = value
        end
      end

      if attributes.key?(:'start_date')
        self.start_date = attributes[:'start_date']
      end

      if attributes.key?(:'end_date')
        self.end_date = attributes[:'end_date']
      end

      if attributes.key?(:'income_sources_count')
        self.income_sources_count = attributes[:'income_sources_count']
      end

      if attributes.key?(:'income_categories_count')
        self.income_categories_count = attributes[:'income_categories_count']
      end

      if attributes.key?(:'income_transactions_count')
        self.income_transactions_count = attributes[:'income_transactions_count']
      end

      if attributes.key?(:'historical_average_monthly_gross_income')
        if (value = attributes[:'historical_average_monthly_gross_income']).is_a?(Array)
          self.historical_average_monthly_gross_income = value
        end
      end

      if attributes.key?(:'historical_average_monthly_income')
        if (value = attributes[:'historical_average_monthly_income']).is_a?(Array)
          self.historical_average_monthly_income = value
        end
      end

      if attributes.key?(:'forecasted_average_monthly_income')
        if (value = attributes[:'forecasted_average_monthly_income']).is_a?(Array)
          self.forecasted_average_monthly_income = value
        end
      end

      if attributes.key?(:'historical_annual_gross_income')
        if (value = attributes[:'historical_annual_gross_income']).is_a?(Array)
          self.historical_annual_gross_income = value
        end
      end

      if attributes.key?(:'historical_annual_income')
        if (value = attributes[:'historical_annual_income']).is_a?(Array)
          self.historical_annual_income = value
        end
      end

      if attributes.key?(:'forecasted_annual_income')
        if (value = attributes[:'forecasted_annual_income']).is_a?(Array)
          self.forecasted_annual_income = value
        end
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
          total_amounts == o.total_amounts &&
          start_date == o.start_date &&
          end_date == o.end_date &&
          income_sources_count == o.income_sources_count &&
          income_categories_count == o.income_categories_count &&
          income_transactions_count == o.income_transactions_count &&
          historical_average_monthly_gross_income == o.historical_average_monthly_gross_income &&
          historical_average_monthly_income == o.historical_average_monthly_income &&
          forecasted_average_monthly_income == o.forecasted_average_monthly_income &&
          historical_annual_gross_income == o.historical_annual_gross_income &&
          historical_annual_income == o.historical_annual_income &&
          forecasted_annual_income == o.forecasted_annual_income &&
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
      [total_amounts, start_date, end_date, income_sources_count, income_categories_count, income_transactions_count, historical_average_monthly_gross_income, historical_average_monthly_income, forecasted_average_monthly_income, historical_annual_gross_income, historical_annual_income, forecasted_annual_income, historical_summary].hash
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
