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
  # The core attributes object contains additional data that can be used to assess the ACH return risk. Examples of data include:  `days_since_first_plaid_connection`: The number of days since the first time the Item was connected to an application via Plaid `plaid_connections_count_7d`: The number of times the Item has been connected to applications via Plaid over the past 7 days `plaid_connections_count_30d`: The number of times the Item has been connected to applications via Plaid over the past 30 days `total_plaid_connections_count`: The number of times the Item has been connected to applications via Plaid `is_savings_or_money_market_account`: Indicates whether the ACH transaction funding account is a savings/money market account  For the full list and detailed documentation of core attributes available, or to request that core attributes not be returned, contact Sales or your Plaid account manager
  class SignalEvaluateCoreAttributes
    # We parse and analyze historical transaction metadata to identify the number of possible past returns due to unauthorized transactions over the past 7 days from the account that will be debited.
    attr_accessor :unauthorized_transactions_count_7d

    # We parse and analyze historical transaction metadata to identify the number of possible past returns due to unauthorized transactions over the past 30 days from the account that will be debited.
    attr_accessor :unauthorized_transactions_count_30d

    # We parse and analyze historical transaction metadata to identify the number of possible past returns due to unauthorized transactions over the past 60 days from the account that will be debited.
    attr_accessor :unauthorized_transactions_count_60d

    # We parse and analyze historical transaction metadata to identify the number of possible past returns due to unauthorized transactions over the past 90 days from the account that will be debited.
    attr_accessor :unauthorized_transactions_count_90d

    # We parse and analyze historical transaction metadata to identify the number of possible past returns due to non-sufficient funds/overdrafts over the past 7 days from the account that will be debited.
    attr_accessor :nsf_overdraft_transactions_count_7d

    # We parse and analyze historical transaction metadata to identify the number of possible past returns due to non-sufficient funds/overdrafts over the past 30 days from the account that will be debited.
    attr_accessor :nsf_overdraft_transactions_count_30d

    # We parse and analyze historical transaction metadata to identify the number of possible past returns due to non-sufficient funds/overdrafts over the past 60 days from the account that will be debited.
    attr_accessor :nsf_overdraft_transactions_count_60d

    # We parse and analyze historical transaction metadata to identify the number of possible past returns due to non-sufficient funds/overdrafts over the past 90 days from the account that will be debited.
    attr_accessor :nsf_overdraft_transactions_count_90d

    # The number of days since the first time the Item was connected to an application via Plaid
    attr_accessor :days_since_first_plaid_connection

    # The number of times the Item has been connected to applications via Plaid over the past 7 days
    attr_accessor :plaid_connections_count_7d

    # The number of times the Item has been connected to applications via Plaid over the past 30 days
    attr_accessor :plaid_connections_count_30d

    # The total number of times the Item has been connected to applications via Plaid
    attr_accessor :total_plaid_connections_count

    # Indicates if the ACH transaction funding account is a savings/money market account
    attr_accessor :is_savings_or_money_market_account

    # The total credit (inflow) transaction amount over the past 10 days from the account that will be debited
    attr_accessor :total_credit_transactions_amount_10d

    # The total debit (outflow) transaction amount over the past 10 days from the account that will be debited
    attr_accessor :total_debit_transactions_amount_10d

    # The 50th percentile of all credit (inflow) transaction amounts over the past 28 days from the account that will be debited
    attr_accessor :p50_credit_transactions_amount_28d

    # The 50th percentile of all debit (outflow) transaction amounts over the past 28 days from the account that will be debited
    attr_accessor :p50_debit_transactions_amount_28d

    # The 95th percentile of all credit (inflow) transaction amounts over the past 28 days from the account that will be debited
    attr_accessor :p95_credit_transactions_amount_28d

    # The 95th percentile of all debit (outflow) transaction amounts over the past 28 days from the account that will be debited
    attr_accessor :p95_debit_transactions_amount_28d

    # The number of days within the past 90 days when the account that will be debited had a negative end-of-day available balance
    attr_accessor :days_with_negative_balance_count_90d

    # The 90th percentile of the end-of-day available balance over the past 30 days of the account that will be debited
    attr_accessor :p90_eod_balance_30d

    # The 90th percentile of the end-of-day available balance over the past 60 days of the account that will be debited
    attr_accessor :p90_eod_balance_60d

    # The 90th percentile of the end-of-day available balance over the past 90 days of the account that will be debited
    attr_accessor :p90_eod_balance_90d

    # The 10th percentile of the end-of-day available balance over the past 30 days of the account that will be debited
    attr_accessor :p10_eod_balance_30d

    # The 10th percentile of the end-of-day available balance over the past 60 days of the account that will be debited
    attr_accessor :p10_eod_balance_60d

    # The 10th percentile of the end-of-day available balance over the past 90 days of the account that will be debited
    attr_accessor :p10_eod_balance_90d

    # Available balance, as of the `balance_last_updated` time. The available balance is the current balance less any outstanding holds or debits that have not yet posted to the account.
    attr_accessor :available_balance

    # Current balance, as of the `balance_last_updated` time. The current balance is the total amount of funds in the account.
    attr_accessor :current_balance

    # Timestamp in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DDTHH:mm:ssZ) indicating the last time that the balance for the given account has been updated.
    attr_accessor :balance_last_updated

    # The number of times the account's phone numbers on file have changed over the past 28 days
    attr_accessor :phone_change_count_28d

    # The number of times the account's phone numbers on file have changed over the past 90 days
    attr_accessor :phone_change_count_90d

    # The number of times the account's email addresses on file have changed over the past 28 days
    attr_accessor :email_change_count_28d

    # The number of times the account's email addresses on file have changed over the past 90 days
    attr_accessor :email_change_count_90d

    # The number of times the account's addresses on file have changed over the past 28 days
    attr_accessor :address_change_count_28d

    # The number of times the account's addresses on file have changed over the past 90 days
    attr_accessor :address_change_count_90d

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'unauthorized_transactions_count_7d' => :'unauthorized_transactions_count_7d',
        :'unauthorized_transactions_count_30d' => :'unauthorized_transactions_count_30d',
        :'unauthorized_transactions_count_60d' => :'unauthorized_transactions_count_60d',
        :'unauthorized_transactions_count_90d' => :'unauthorized_transactions_count_90d',
        :'nsf_overdraft_transactions_count_7d' => :'nsf_overdraft_transactions_count_7d',
        :'nsf_overdraft_transactions_count_30d' => :'nsf_overdraft_transactions_count_30d',
        :'nsf_overdraft_transactions_count_60d' => :'nsf_overdraft_transactions_count_60d',
        :'nsf_overdraft_transactions_count_90d' => :'nsf_overdraft_transactions_count_90d',
        :'days_since_first_plaid_connection' => :'days_since_first_plaid_connection',
        :'plaid_connections_count_7d' => :'plaid_connections_count_7d',
        :'plaid_connections_count_30d' => :'plaid_connections_count_30d',
        :'total_plaid_connections_count' => :'total_plaid_connections_count',
        :'is_savings_or_money_market_account' => :'is_savings_or_money_market_account',
        :'total_credit_transactions_amount_10d' => :'total_credit_transactions_amount_10d',
        :'total_debit_transactions_amount_10d' => :'total_debit_transactions_amount_10d',
        :'p50_credit_transactions_amount_28d' => :'p50_credit_transactions_amount_28d',
        :'p50_debit_transactions_amount_28d' => :'p50_debit_transactions_amount_28d',
        :'p95_credit_transactions_amount_28d' => :'p95_credit_transactions_amount_28d',
        :'p95_debit_transactions_amount_28d' => :'p95_debit_transactions_amount_28d',
        :'days_with_negative_balance_count_90d' => :'days_with_negative_balance_count_90d',
        :'p90_eod_balance_30d' => :'p90_eod_balance_30d',
        :'p90_eod_balance_60d' => :'p90_eod_balance_60d',
        :'p90_eod_balance_90d' => :'p90_eod_balance_90d',
        :'p10_eod_balance_30d' => :'p10_eod_balance_30d',
        :'p10_eod_balance_60d' => :'p10_eod_balance_60d',
        :'p10_eod_balance_90d' => :'p10_eod_balance_90d',
        :'available_balance' => :'available_balance',
        :'current_balance' => :'current_balance',
        :'balance_last_updated' => :'balance_last_updated',
        :'phone_change_count_28d' => :'phone_change_count_28d',
        :'phone_change_count_90d' => :'phone_change_count_90d',
        :'email_change_count_28d' => :'email_change_count_28d',
        :'email_change_count_90d' => :'email_change_count_90d',
        :'address_change_count_28d' => :'address_change_count_28d',
        :'address_change_count_90d' => :'address_change_count_90d'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'unauthorized_transactions_count_7d' => :'Integer',
        :'unauthorized_transactions_count_30d' => :'Integer',
        :'unauthorized_transactions_count_60d' => :'Integer',
        :'unauthorized_transactions_count_90d' => :'Integer',
        :'nsf_overdraft_transactions_count_7d' => :'Integer',
        :'nsf_overdraft_transactions_count_30d' => :'Integer',
        :'nsf_overdraft_transactions_count_60d' => :'Integer',
        :'nsf_overdraft_transactions_count_90d' => :'Integer',
        :'days_since_first_plaid_connection' => :'Integer',
        :'plaid_connections_count_7d' => :'Integer',
        :'plaid_connections_count_30d' => :'Integer',
        :'total_plaid_connections_count' => :'Integer',
        :'is_savings_or_money_market_account' => :'Boolean',
        :'total_credit_transactions_amount_10d' => :'Float',
        :'total_debit_transactions_amount_10d' => :'Float',
        :'p50_credit_transactions_amount_28d' => :'Float',
        :'p50_debit_transactions_amount_28d' => :'Float',
        :'p95_credit_transactions_amount_28d' => :'Float',
        :'p95_debit_transactions_amount_28d' => :'Float',
        :'days_with_negative_balance_count_90d' => :'Integer',
        :'p90_eod_balance_30d' => :'Float',
        :'p90_eod_balance_60d' => :'Float',
        :'p90_eod_balance_90d' => :'Float',
        :'p10_eod_balance_30d' => :'Float',
        :'p10_eod_balance_60d' => :'Float',
        :'p10_eod_balance_90d' => :'Float',
        :'available_balance' => :'Float',
        :'current_balance' => :'Float',
        :'balance_last_updated' => :'Time',
        :'phone_change_count_28d' => :'Integer',
        :'phone_change_count_90d' => :'Integer',
        :'email_change_count_28d' => :'Integer',
        :'email_change_count_90d' => :'Integer',
        :'address_change_count_28d' => :'Integer',
        :'address_change_count_90d' => :'Integer'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'days_since_first_plaid_connection',
        :'plaid_connections_count_7d',
        :'plaid_connections_count_30d',
        :'total_plaid_connections_count',
        :'p50_credit_transactions_amount_28d',
        :'p50_debit_transactions_amount_28d',
        :'p95_credit_transactions_amount_28d',
        :'p95_debit_transactions_amount_28d',
        :'days_with_negative_balance_count_90d',
        :'p90_eod_balance_30d',
        :'p90_eod_balance_60d',
        :'p90_eod_balance_90d',
        :'p10_eod_balance_30d',
        :'p10_eod_balance_60d',
        :'p10_eod_balance_90d',
        :'available_balance',
        :'current_balance',
        :'balance_last_updated',
        :'phone_change_count_28d',
        :'phone_change_count_90d',
        :'email_change_count_28d',
        :'email_change_count_90d',
        :'address_change_count_28d',
        :'address_change_count_90d'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::SignalEvaluateCoreAttributes` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::SignalEvaluateCoreAttributes`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'unauthorized_transactions_count_7d')
        self.unauthorized_transactions_count_7d = attributes[:'unauthorized_transactions_count_7d']
      end

      if attributes.key?(:'unauthorized_transactions_count_30d')
        self.unauthorized_transactions_count_30d = attributes[:'unauthorized_transactions_count_30d']
      end

      if attributes.key?(:'unauthorized_transactions_count_60d')
        self.unauthorized_transactions_count_60d = attributes[:'unauthorized_transactions_count_60d']
      end

      if attributes.key?(:'unauthorized_transactions_count_90d')
        self.unauthorized_transactions_count_90d = attributes[:'unauthorized_transactions_count_90d']
      end

      if attributes.key?(:'nsf_overdraft_transactions_count_7d')
        self.nsf_overdraft_transactions_count_7d = attributes[:'nsf_overdraft_transactions_count_7d']
      end

      if attributes.key?(:'nsf_overdraft_transactions_count_30d')
        self.nsf_overdraft_transactions_count_30d = attributes[:'nsf_overdraft_transactions_count_30d']
      end

      if attributes.key?(:'nsf_overdraft_transactions_count_60d')
        self.nsf_overdraft_transactions_count_60d = attributes[:'nsf_overdraft_transactions_count_60d']
      end

      if attributes.key?(:'nsf_overdraft_transactions_count_90d')
        self.nsf_overdraft_transactions_count_90d = attributes[:'nsf_overdraft_transactions_count_90d']
      end

      if attributes.key?(:'days_since_first_plaid_connection')
        self.days_since_first_plaid_connection = attributes[:'days_since_first_plaid_connection']
      end

      if attributes.key?(:'plaid_connections_count_7d')
        self.plaid_connections_count_7d = attributes[:'plaid_connections_count_7d']
      end

      if attributes.key?(:'plaid_connections_count_30d')
        self.plaid_connections_count_30d = attributes[:'plaid_connections_count_30d']
      end

      if attributes.key?(:'total_plaid_connections_count')
        self.total_plaid_connections_count = attributes[:'total_plaid_connections_count']
      end

      if attributes.key?(:'is_savings_or_money_market_account')
        self.is_savings_or_money_market_account = attributes[:'is_savings_or_money_market_account']
      end

      if attributes.key?(:'total_credit_transactions_amount_10d')
        self.total_credit_transactions_amount_10d = attributes[:'total_credit_transactions_amount_10d']
      end

      if attributes.key?(:'total_debit_transactions_amount_10d')
        self.total_debit_transactions_amount_10d = attributes[:'total_debit_transactions_amount_10d']
      end

      if attributes.key?(:'p50_credit_transactions_amount_28d')
        self.p50_credit_transactions_amount_28d = attributes[:'p50_credit_transactions_amount_28d']
      end

      if attributes.key?(:'p50_debit_transactions_amount_28d')
        self.p50_debit_transactions_amount_28d = attributes[:'p50_debit_transactions_amount_28d']
      end

      if attributes.key?(:'p95_credit_transactions_amount_28d')
        self.p95_credit_transactions_amount_28d = attributes[:'p95_credit_transactions_amount_28d']
      end

      if attributes.key?(:'p95_debit_transactions_amount_28d')
        self.p95_debit_transactions_amount_28d = attributes[:'p95_debit_transactions_amount_28d']
      end

      if attributes.key?(:'days_with_negative_balance_count_90d')
        self.days_with_negative_balance_count_90d = attributes[:'days_with_negative_balance_count_90d']
      end

      if attributes.key?(:'p90_eod_balance_30d')
        self.p90_eod_balance_30d = attributes[:'p90_eod_balance_30d']
      end

      if attributes.key?(:'p90_eod_balance_60d')
        self.p90_eod_balance_60d = attributes[:'p90_eod_balance_60d']
      end

      if attributes.key?(:'p90_eod_balance_90d')
        self.p90_eod_balance_90d = attributes[:'p90_eod_balance_90d']
      end

      if attributes.key?(:'p10_eod_balance_30d')
        self.p10_eod_balance_30d = attributes[:'p10_eod_balance_30d']
      end

      if attributes.key?(:'p10_eod_balance_60d')
        self.p10_eod_balance_60d = attributes[:'p10_eod_balance_60d']
      end

      if attributes.key?(:'p10_eod_balance_90d')
        self.p10_eod_balance_90d = attributes[:'p10_eod_balance_90d']
      end

      if attributes.key?(:'available_balance')
        self.available_balance = attributes[:'available_balance']
      end

      if attributes.key?(:'current_balance')
        self.current_balance = attributes[:'current_balance']
      end

      if attributes.key?(:'balance_last_updated')
        self.balance_last_updated = attributes[:'balance_last_updated']
      end

      if attributes.key?(:'phone_change_count_28d')
        self.phone_change_count_28d = attributes[:'phone_change_count_28d']
      end

      if attributes.key?(:'phone_change_count_90d')
        self.phone_change_count_90d = attributes[:'phone_change_count_90d']
      end

      if attributes.key?(:'email_change_count_28d')
        self.email_change_count_28d = attributes[:'email_change_count_28d']
      end

      if attributes.key?(:'email_change_count_90d')
        self.email_change_count_90d = attributes[:'email_change_count_90d']
      end

      if attributes.key?(:'address_change_count_28d')
        self.address_change_count_28d = attributes[:'address_change_count_28d']
      end

      if attributes.key?(:'address_change_count_90d')
        self.address_change_count_90d = attributes[:'address_change_count_90d']
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
          unauthorized_transactions_count_7d == o.unauthorized_transactions_count_7d &&
          unauthorized_transactions_count_30d == o.unauthorized_transactions_count_30d &&
          unauthorized_transactions_count_60d == o.unauthorized_transactions_count_60d &&
          unauthorized_transactions_count_90d == o.unauthorized_transactions_count_90d &&
          nsf_overdraft_transactions_count_7d == o.nsf_overdraft_transactions_count_7d &&
          nsf_overdraft_transactions_count_30d == o.nsf_overdraft_transactions_count_30d &&
          nsf_overdraft_transactions_count_60d == o.nsf_overdraft_transactions_count_60d &&
          nsf_overdraft_transactions_count_90d == o.nsf_overdraft_transactions_count_90d &&
          days_since_first_plaid_connection == o.days_since_first_plaid_connection &&
          plaid_connections_count_7d == o.plaid_connections_count_7d &&
          plaid_connections_count_30d == o.plaid_connections_count_30d &&
          total_plaid_connections_count == o.total_plaid_connections_count &&
          is_savings_or_money_market_account == o.is_savings_or_money_market_account &&
          total_credit_transactions_amount_10d == o.total_credit_transactions_amount_10d &&
          total_debit_transactions_amount_10d == o.total_debit_transactions_amount_10d &&
          p50_credit_transactions_amount_28d == o.p50_credit_transactions_amount_28d &&
          p50_debit_transactions_amount_28d == o.p50_debit_transactions_amount_28d &&
          p95_credit_transactions_amount_28d == o.p95_credit_transactions_amount_28d &&
          p95_debit_transactions_amount_28d == o.p95_debit_transactions_amount_28d &&
          days_with_negative_balance_count_90d == o.days_with_negative_balance_count_90d &&
          p90_eod_balance_30d == o.p90_eod_balance_30d &&
          p90_eod_balance_60d == o.p90_eod_balance_60d &&
          p90_eod_balance_90d == o.p90_eod_balance_90d &&
          p10_eod_balance_30d == o.p10_eod_balance_30d &&
          p10_eod_balance_60d == o.p10_eod_balance_60d &&
          p10_eod_balance_90d == o.p10_eod_balance_90d &&
          available_balance == o.available_balance &&
          current_balance == o.current_balance &&
          balance_last_updated == o.balance_last_updated &&
          phone_change_count_28d == o.phone_change_count_28d &&
          phone_change_count_90d == o.phone_change_count_90d &&
          email_change_count_28d == o.email_change_count_28d &&
          email_change_count_90d == o.email_change_count_90d &&
          address_change_count_28d == o.address_change_count_28d &&
          address_change_count_90d == o.address_change_count_90d
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [unauthorized_transactions_count_7d, unauthorized_transactions_count_30d, unauthorized_transactions_count_60d, unauthorized_transactions_count_90d, nsf_overdraft_transactions_count_7d, nsf_overdraft_transactions_count_30d, nsf_overdraft_transactions_count_60d, nsf_overdraft_transactions_count_90d, days_since_first_plaid_connection, plaid_connections_count_7d, plaid_connections_count_30d, total_plaid_connections_count, is_savings_or_money_market_account, total_credit_transactions_amount_10d, total_debit_transactions_amount_10d, p50_credit_transactions_amount_28d, p50_debit_transactions_amount_28d, p95_credit_transactions_amount_28d, p95_debit_transactions_amount_28d, days_with_negative_balance_count_90d, p90_eod_balance_30d, p90_eod_balance_60d, p90_eod_balance_90d, p10_eod_balance_30d, p10_eod_balance_60d, p10_eod_balance_90d, available_balance, current_balance, balance_last_updated, phone_change_count_28d, phone_change_count_90d, email_change_count_28d, email_change_count_90d, address_change_count_28d, address_change_count_90d].hash
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
