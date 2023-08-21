=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.419.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.1.0

=end

require 'date'
require 'time'

module Plaid
  # Calculated insights derived from transaction-level data.
  class BaseReportAccountInsights
    # Date of the earliest transaction in the base report for the account.
    attr_accessor :oldest_transaction_date

    # Date of the most recent transaction in the base report for the account.
    attr_accessor :most_recent_transaction_date

    # Number of days days available in the base report for the account.
    attr_accessor :days_available

    # Average number of days between sequential transactions
    attr_accessor :average_days_between_transactions

    # Longest gap between sequential transactions
    attr_accessor :longest_gap_between_transactions

    # The number of debits into the account. This field will be null for non-depository accounts.
    attr_accessor :number_of_inflows

    # Average amount of debit transactions into account. This field will be null for non-depository accounts. This field only takes into account USD transactions from the account.
    attr_accessor :average_inflow_amount

    # The number of credit into the account. This field will be null for non-depository accounts.
    attr_accessor :number_of_outflows

    # Average amount of credit transactions into account. This field will be null for non-depository accounts. This field only takes into account USD transactions from the account.
    attr_accessor :average_outflow_amount

    # Number of days with no transactions
    attr_accessor :number_of_days_no_transactions

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'oldest_transaction_date' => :'oldest_transaction_date',
        :'most_recent_transaction_date' => :'most_recent_transaction_date',
        :'days_available' => :'days_available',
        :'average_days_between_transactions' => :'average_days_between_transactions',
        :'longest_gap_between_transactions' => :'longest_gap_between_transactions',
        :'number_of_inflows' => :'number_of_inflows',
        :'average_inflow_amount' => :'average_inflow_amount',
        :'number_of_outflows' => :'number_of_outflows',
        :'average_outflow_amount' => :'average_outflow_amount',
        :'number_of_days_no_transactions' => :'number_of_days_no_transactions'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'oldest_transaction_date' => :'String',
        :'most_recent_transaction_date' => :'String',
        :'days_available' => :'Integer',
        :'average_days_between_transactions' => :'Float',
        :'longest_gap_between_transactions' => :'Array<BaseReportLongestGapInsights>',
        :'number_of_inflows' => :'Array<BaseReportNumberFlowInsights>',
        :'average_inflow_amount' => :'Array<BaseReportAverageFlowInsights>',
        :'number_of_outflows' => :'Array<BaseReportNumberFlowInsights>',
        :'average_outflow_amount' => :'Array<BaseReportAverageFlowInsights>',
        :'number_of_days_no_transactions' => :'Integer'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'number_of_inflows',
        :'average_inflow_amount',
        :'number_of_outflows',
        :'average_outflow_amount',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::BaseReportAccountInsights` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::BaseReportAccountInsights`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'oldest_transaction_date')
        self.oldest_transaction_date = attributes[:'oldest_transaction_date']
      end

      if attributes.key?(:'most_recent_transaction_date')
        self.most_recent_transaction_date = attributes[:'most_recent_transaction_date']
      end

      if attributes.key?(:'days_available')
        self.days_available = attributes[:'days_available']
      end

      if attributes.key?(:'average_days_between_transactions')
        self.average_days_between_transactions = attributes[:'average_days_between_transactions']
      end

      if attributes.key?(:'longest_gap_between_transactions')
        if (value = attributes[:'longest_gap_between_transactions']).is_a?(Array)
          self.longest_gap_between_transactions = value
        end
      end

      if attributes.key?(:'number_of_inflows')
        if (value = attributes[:'number_of_inflows']).is_a?(Array)
          self.number_of_inflows = value
        end
      end

      if attributes.key?(:'average_inflow_amount')
        if (value = attributes[:'average_inflow_amount']).is_a?(Array)
          self.average_inflow_amount = value
        end
      end

      if attributes.key?(:'number_of_outflows')
        if (value = attributes[:'number_of_outflows']).is_a?(Array)
          self.number_of_outflows = value
        end
      end

      if attributes.key?(:'average_outflow_amount')
        if (value = attributes[:'average_outflow_amount']).is_a?(Array)
          self.average_outflow_amount = value
        end
      end

      if attributes.key?(:'number_of_days_no_transactions')
        self.number_of_days_no_transactions = attributes[:'number_of_days_no_transactions']
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
          oldest_transaction_date == o.oldest_transaction_date &&
          most_recent_transaction_date == o.most_recent_transaction_date &&
          days_available == o.days_available &&
          average_days_between_transactions == o.average_days_between_transactions &&
          longest_gap_between_transactions == o.longest_gap_between_transactions &&
          number_of_inflows == o.number_of_inflows &&
          average_inflow_amount == o.average_inflow_amount &&
          number_of_outflows == o.number_of_outflows &&
          average_outflow_amount == o.average_outflow_amount &&
          number_of_days_no_transactions == o.number_of_days_no_transactions
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [oldest_transaction_date, most_recent_transaction_date, days_available, average_days_between_transactions, longest_gap_between_transactions, number_of_inflows, average_inflow_amount, number_of_outflows, average_outflow_amount, number_of_days_no_transactions].hash
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
