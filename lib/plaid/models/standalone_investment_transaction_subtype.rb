=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.20.6

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.1.0

=end

require 'date'
require 'time'

module Plaid
  # Valid subtypes for Investment transaction subtypes. Note that transactions representing inflow of cash will appear as negative amounts, outflow of cash will appear as positive amounts.
  class StandaloneInvestmentTransactionSubtype
    # Fees paid for account maintenance
    attr_accessor :account_fee

    # Assignment of short option holding
    attr_accessor :assignment

    # Purchase to open or increase a position
    attr_accessor :buy

    # Purchase to close a short position
    attr_accessor :buy_to_cover

    # Inflow of assets into a tax-advantaged account
    attr_accessor :contribution

    # Inflow of cash into an account
    attr_accessor :deposit

    # Outflow of assets from a tax-advantaged account
    attr_accessor :distribution

    # Inflow of cash from a dividend
    attr_accessor :dividend

    # Purchase using proceeds from a cash dividend
    attr_accessor :dividend_reinvestment

    # Exercise of an option or warrant contract
    attr_accessor :exercise

    # Expiration of an option or warrant contract 
    attr_accessor :expire

    # Fees paid for administration of a mutual fund or other pooled investment vehicle
    attr_accessor :fund_fee

    # Inflow of cash from interest
    attr_accessor :interest

    # Inflow of cash from interest receivable
    attr_accessor :interest_receivable

    # Purchase using proceeds from a cash interest payment
    attr_accessor :interest_reinvestment

    # Fees paid for legal charges or services
    attr_accessor :legal_fee

    # Inflow of cash related to payment on a loan
    attr_accessor :loan_payment

    # Long-term capital gain received as cash
    attr_accessor :long_term_capital_gain

    # Purchase using long-term capital gain cash proceeds
    attr_accessor :long_term_capital_gain_reinvestment

    # Fees paid for investment management of a mutual fund or other pooled investment vehicle
    attr_accessor :management_fee

    # Fees paid for maintaining margin debt
    attr_accessor :margin_expense

    # Stock exchanged at a pre-defined ratio as part of a merger between companies
    attr_accessor :merger

    # Fee associated with various account or holding actions
    attr_accessor :miscellaneous_fee

    # Inflow of cash from a non-qualified dividend
    attr_accessor :non_qualified_dividend

    # Taxes paid on behalf of the investor for non-residency in investment jurisdiction
    attr_accessor :non_resident_tax

    # Pending inflow of cash
    attr_accessor :pending_credit

    # Pending outflow of cash
    attr_accessor :pending_debit

    # Inflow of cash from a qualified dividend
    attr_accessor :qualified_dividend

    # Rebalancing transaction (buy or sell) with no net impact to value in the account
    attr_accessor :rebalance

    # Repayment of loan principal
    attr_accessor :return_of_principal

    # Sell to close or decrease an existing holding
    attr_accessor :sell

    # Sell to open a short position
    attr_accessor :sell_short

    # Short-term capital gain received as cash
    attr_accessor :short_term_capital_gain

    # Purchase using short-term capital gain cash proceeds
    attr_accessor :short_term_capital_gain_reinvestment

    # Inflow of stock from spin-off transaction of an existing holding
    attr_accessor :spin_off

    # Inflow of stock from a forward split of an existing holding
    attr_accessor :split

    # Inflow of stock from a distribution
    attr_accessor :stock_distribution

    # Taxes paid on behalf of the investor
    attr_accessor :tax

    # Taxes withheld on behalf of the customer
    attr_accessor :tax_withheld

    # Movement of assets into or out of an account
    attr_accessor :transfer

    # Fees incurred for transfer of a holding or account
    attr_accessor :transfer_fee

    # Fees related to adminstration of a trust account
    attr_accessor :trust_fee

    # Unqualified capital gain received as cash
    attr_accessor :unqualified_gain

    # Outflow of cash from an account
    attr_accessor :withdrawal

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'account_fee' => :'account fee',
        :'assignment' => :'assignment',
        :'buy' => :'buy',
        :'buy_to_cover' => :'buy to cover',
        :'contribution' => :'contribution',
        :'deposit' => :'deposit',
        :'distribution' => :'distribution',
        :'dividend' => :'dividend',
        :'dividend_reinvestment' => :'dividend reinvestment',
        :'exercise' => :'exercise',
        :'expire' => :'expire',
        :'fund_fee' => :'fund fee',
        :'interest' => :'interest',
        :'interest_receivable' => :'interest receivable',
        :'interest_reinvestment' => :'interest reinvestment',
        :'legal_fee' => :'legal fee',
        :'loan_payment' => :'loan payment',
        :'long_term_capital_gain' => :'long-term capital gain',
        :'long_term_capital_gain_reinvestment' => :'long-term capital gain reinvestment',
        :'management_fee' => :'management fee',
        :'margin_expense' => :'margin expense',
        :'merger' => :'merger',
        :'miscellaneous_fee' => :'miscellaneous fee',
        :'non_qualified_dividend' => :'non-qualified dividend',
        :'non_resident_tax' => :'non-resident tax',
        :'pending_credit' => :'pending credit',
        :'pending_debit' => :'pending debit',
        :'qualified_dividend' => :'qualified dividend',
        :'rebalance' => :'rebalance',
        :'return_of_principal' => :'return of principal',
        :'sell' => :'sell',
        :'sell_short' => :'sell short',
        :'short_term_capital_gain' => :'short-term capital gain',
        :'short_term_capital_gain_reinvestment' => :'short-term capital gain reinvestment',
        :'spin_off' => :'spin off',
        :'split' => :'split',
        :'stock_distribution' => :'stock distribution',
        :'tax' => :'tax',
        :'tax_withheld' => :'tax withheld',
        :'transfer' => :'transfer',
        :'transfer_fee' => :'transfer fee',
        :'trust_fee' => :'trust fee',
        :'unqualified_gain' => :'unqualified gain',
        :'withdrawal' => :'withdrawal'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'account_fee' => :'String',
        :'assignment' => :'String',
        :'buy' => :'String',
        :'buy_to_cover' => :'String',
        :'contribution' => :'String',
        :'deposit' => :'String',
        :'distribution' => :'String',
        :'dividend' => :'String',
        :'dividend_reinvestment' => :'String',
        :'exercise' => :'String',
        :'expire' => :'String',
        :'fund_fee' => :'String',
        :'interest' => :'String',
        :'interest_receivable' => :'String',
        :'interest_reinvestment' => :'String',
        :'legal_fee' => :'String',
        :'loan_payment' => :'String',
        :'long_term_capital_gain' => :'String',
        :'long_term_capital_gain_reinvestment' => :'String',
        :'management_fee' => :'String',
        :'margin_expense' => :'String',
        :'merger' => :'String',
        :'miscellaneous_fee' => :'String',
        :'non_qualified_dividend' => :'String',
        :'non_resident_tax' => :'String',
        :'pending_credit' => :'String',
        :'pending_debit' => :'String',
        :'qualified_dividend' => :'String',
        :'rebalance' => :'String',
        :'return_of_principal' => :'String',
        :'sell' => :'String',
        :'sell_short' => :'String',
        :'short_term_capital_gain' => :'String',
        :'short_term_capital_gain_reinvestment' => :'String',
        :'spin_off' => :'String',
        :'split' => :'String',
        :'stock_distribution' => :'String',
        :'tax' => :'String',
        :'tax_withheld' => :'String',
        :'transfer' => :'String',
        :'transfer_fee' => :'String',
        :'trust_fee' => :'String',
        :'unqualified_gain' => :'String',
        :'withdrawal' => :'String'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::StandaloneInvestmentTransactionSubtype` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::StandaloneInvestmentTransactionSubtype`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'account_fee')
        self.account_fee = attributes[:'account_fee']
      end

      if attributes.key?(:'assignment')
        self.assignment = attributes[:'assignment']
      end

      if attributes.key?(:'buy')
        self.buy = attributes[:'buy']
      end

      if attributes.key?(:'buy_to_cover')
        self.buy_to_cover = attributes[:'buy_to_cover']
      end

      if attributes.key?(:'contribution')
        self.contribution = attributes[:'contribution']
      end

      if attributes.key?(:'deposit')
        self.deposit = attributes[:'deposit']
      end

      if attributes.key?(:'distribution')
        self.distribution = attributes[:'distribution']
      end

      if attributes.key?(:'dividend')
        self.dividend = attributes[:'dividend']
      end

      if attributes.key?(:'dividend_reinvestment')
        self.dividend_reinvestment = attributes[:'dividend_reinvestment']
      end

      if attributes.key?(:'exercise')
        self.exercise = attributes[:'exercise']
      end

      if attributes.key?(:'expire')
        self.expire = attributes[:'expire']
      end

      if attributes.key?(:'fund_fee')
        self.fund_fee = attributes[:'fund_fee']
      end

      if attributes.key?(:'interest')
        self.interest = attributes[:'interest']
      end

      if attributes.key?(:'interest_receivable')
        self.interest_receivable = attributes[:'interest_receivable']
      end

      if attributes.key?(:'interest_reinvestment')
        self.interest_reinvestment = attributes[:'interest_reinvestment']
      end

      if attributes.key?(:'legal_fee')
        self.legal_fee = attributes[:'legal_fee']
      end

      if attributes.key?(:'loan_payment')
        self.loan_payment = attributes[:'loan_payment']
      end

      if attributes.key?(:'long_term_capital_gain')
        self.long_term_capital_gain = attributes[:'long_term_capital_gain']
      end

      if attributes.key?(:'long_term_capital_gain_reinvestment')
        self.long_term_capital_gain_reinvestment = attributes[:'long_term_capital_gain_reinvestment']
      end

      if attributes.key?(:'management_fee')
        self.management_fee = attributes[:'management_fee']
      end

      if attributes.key?(:'margin_expense')
        self.margin_expense = attributes[:'margin_expense']
      end

      if attributes.key?(:'merger')
        self.merger = attributes[:'merger']
      end

      if attributes.key?(:'miscellaneous_fee')
        self.miscellaneous_fee = attributes[:'miscellaneous_fee']
      end

      if attributes.key?(:'non_qualified_dividend')
        self.non_qualified_dividend = attributes[:'non_qualified_dividend']
      end

      if attributes.key?(:'non_resident_tax')
        self.non_resident_tax = attributes[:'non_resident_tax']
      end

      if attributes.key?(:'pending_credit')
        self.pending_credit = attributes[:'pending_credit']
      end

      if attributes.key?(:'pending_debit')
        self.pending_debit = attributes[:'pending_debit']
      end

      if attributes.key?(:'qualified_dividend')
        self.qualified_dividend = attributes[:'qualified_dividend']
      end

      if attributes.key?(:'rebalance')
        self.rebalance = attributes[:'rebalance']
      end

      if attributes.key?(:'return_of_principal')
        self.return_of_principal = attributes[:'return_of_principal']
      end

      if attributes.key?(:'sell')
        self.sell = attributes[:'sell']
      end

      if attributes.key?(:'sell_short')
        self.sell_short = attributes[:'sell_short']
      end

      if attributes.key?(:'short_term_capital_gain')
        self.short_term_capital_gain = attributes[:'short_term_capital_gain']
      end

      if attributes.key?(:'short_term_capital_gain_reinvestment')
        self.short_term_capital_gain_reinvestment = attributes[:'short_term_capital_gain_reinvestment']
      end

      if attributes.key?(:'spin_off')
        self.spin_off = attributes[:'spin_off']
      end

      if attributes.key?(:'split')
        self.split = attributes[:'split']
      end

      if attributes.key?(:'stock_distribution')
        self.stock_distribution = attributes[:'stock_distribution']
      end

      if attributes.key?(:'tax')
        self.tax = attributes[:'tax']
      end

      if attributes.key?(:'tax_withheld')
        self.tax_withheld = attributes[:'tax_withheld']
      end

      if attributes.key?(:'transfer')
        self.transfer = attributes[:'transfer']
      end

      if attributes.key?(:'transfer_fee')
        self.transfer_fee = attributes[:'transfer_fee']
      end

      if attributes.key?(:'trust_fee')
        self.trust_fee = attributes[:'trust_fee']
      end

      if attributes.key?(:'unqualified_gain')
        self.unqualified_gain = attributes[:'unqualified_gain']
      end

      if attributes.key?(:'withdrawal')
        self.withdrawal = attributes[:'withdrawal']
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
          account_fee == o.account_fee &&
          assignment == o.assignment &&
          buy == o.buy &&
          buy_to_cover == o.buy_to_cover &&
          contribution == o.contribution &&
          deposit == o.deposit &&
          distribution == o.distribution &&
          dividend == o.dividend &&
          dividend_reinvestment == o.dividend_reinvestment &&
          exercise == o.exercise &&
          expire == o.expire &&
          fund_fee == o.fund_fee &&
          interest == o.interest &&
          interest_receivable == o.interest_receivable &&
          interest_reinvestment == o.interest_reinvestment &&
          legal_fee == o.legal_fee &&
          loan_payment == o.loan_payment &&
          long_term_capital_gain == o.long_term_capital_gain &&
          long_term_capital_gain_reinvestment == o.long_term_capital_gain_reinvestment &&
          management_fee == o.management_fee &&
          margin_expense == o.margin_expense &&
          merger == o.merger &&
          miscellaneous_fee == o.miscellaneous_fee &&
          non_qualified_dividend == o.non_qualified_dividend &&
          non_resident_tax == o.non_resident_tax &&
          pending_credit == o.pending_credit &&
          pending_debit == o.pending_debit &&
          qualified_dividend == o.qualified_dividend &&
          rebalance == o.rebalance &&
          return_of_principal == o.return_of_principal &&
          sell == o.sell &&
          sell_short == o.sell_short &&
          short_term_capital_gain == o.short_term_capital_gain &&
          short_term_capital_gain_reinvestment == o.short_term_capital_gain_reinvestment &&
          spin_off == o.spin_off &&
          split == o.split &&
          stock_distribution == o.stock_distribution &&
          tax == o.tax &&
          tax_withheld == o.tax_withheld &&
          transfer == o.transfer &&
          transfer_fee == o.transfer_fee &&
          trust_fee == o.trust_fee &&
          unqualified_gain == o.unqualified_gain &&
          withdrawal == o.withdrawal
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [account_fee, assignment, buy, buy_to_cover, contribution, deposit, distribution, dividend, dividend_reinvestment, exercise, expire, fund_fee, interest, interest_receivable, interest_reinvestment, legal_fee, loan_payment, long_term_capital_gain, long_term_capital_gain_reinvestment, management_fee, margin_expense, merger, miscellaneous_fee, non_qualified_dividend, non_resident_tax, pending_credit, pending_debit, qualified_dividend, rebalance, return_of_principal, sell, sell_short, short_term_capital_gain, short_term_capital_gain_reinvestment, spin_off, split, stock_distribution, tax, tax_withheld, transfer, transfer_fee, trust_fee, unqualified_gain, withdrawal].hash
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
