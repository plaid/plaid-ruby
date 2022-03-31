=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.94.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.1.1

=end

require 'date'
require 'time'

module Plaid
  # Used to configure Sandbox test data for the Liabilities product
  class LiabilityOverride
    # The type of the liability object, either `credit` or `student`. Mortgages are not currently supported in the custom Sandbox.
    attr_accessor :type

    # The purchase APR percentage value. For simplicity, this is the only interest rate used to calculate interest charges. Can only be set if `type` is `credit`.
    attr_accessor :purchase_apr

    # The cash APR percentage value. Can only be set if `type` is `credit`.
    attr_accessor :cash_apr

    # The balance transfer APR percentage value. Can only be set if `type` is `credit`. Can only be set if `type` is `credit`.
    attr_accessor :balance_transfer_apr

    # The special APR percentage value. Can only be set if `type` is `credit`.
    attr_accessor :special_apr

    # Override the `last_payment_amount` field. Can only be set if `type` is `credit`.
    attr_accessor :last_payment_amount

    # Override the `minimum_payment_amount` field. Can only be set if `type` is `credit` or `student`.
    attr_accessor :minimum_payment_amount

    # Override the `is_overdue` field
    attr_accessor :is_overdue

    # The date on which the loan was initially lent, in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) (YYYY-MM-DD) format. Can only be set if `type` is `student`.
    attr_accessor :origination_date

    # The original loan principal. Can only be set if `type` is `student`.
    attr_accessor :principal

    # The interest rate on the loan as a percentage. Can only be set if `type` is `student`.
    attr_accessor :nominal_apr

    # If set, interest capitalization begins at the given number of months after loan origination. By default interest is never capitalized. Can only be set if `type` is `student`.
    attr_accessor :interest_capitalization_grace_period_months

    attr_accessor :repayment_model

    # Override the `expected_payoff_date` field. Can only be set if `type` is `student`.
    attr_accessor :expected_payoff_date

    # Override the `guarantor` field. Can only be set if `type` is `student`.
    attr_accessor :guarantor

    # Override the `is_federal` field. Can only be set if `type` is `student`.
    attr_accessor :is_federal

    # Override the `loan_name` field. Can only be set if `type` is `student`.
    attr_accessor :loan_name

    attr_accessor :loan_status

    # Override the `payment_reference_number` field. Can only be set if `type` is `student`.
    attr_accessor :payment_reference_number

    attr_accessor :pslf_status

    # Override the `repayment_plan.description` field. Can only be set if `type` is `student`.
    attr_accessor :repayment_plan_description

    # Override the `repayment_plan.type` field. Can only be set if `type` is `student`. Possible values are: `\"extended graduated\"`, `\"extended standard\"`, `\"graduated\"`, `\"income-contingent repayment\"`, `\"income-based repayment\"`, `\"interest only\"`, `\"other\"`, `\"pay as you earn\"`, `\"revised pay as you earn\"`, or `\"standard\"`.
    attr_accessor :repayment_plan_type

    # Override the `sequence_number` field. Can only be set if `type` is `student`.
    attr_accessor :sequence_number

    attr_accessor :servicer_address

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'type' => :'type',
        :'purchase_apr' => :'purchase_apr',
        :'cash_apr' => :'cash_apr',
        :'balance_transfer_apr' => :'balance_transfer_apr',
        :'special_apr' => :'special_apr',
        :'last_payment_amount' => :'last_payment_amount',
        :'minimum_payment_amount' => :'minimum_payment_amount',
        :'is_overdue' => :'is_overdue',
        :'origination_date' => :'origination_date',
        :'principal' => :'principal',
        :'nominal_apr' => :'nominal_apr',
        :'interest_capitalization_grace_period_months' => :'interest_capitalization_grace_period_months',
        :'repayment_model' => :'repayment_model',
        :'expected_payoff_date' => :'expected_payoff_date',
        :'guarantor' => :'guarantor',
        :'is_federal' => :'is_federal',
        :'loan_name' => :'loan_name',
        :'loan_status' => :'loan_status',
        :'payment_reference_number' => :'payment_reference_number',
        :'pslf_status' => :'pslf_status',
        :'repayment_plan_description' => :'repayment_plan_description',
        :'repayment_plan_type' => :'repayment_plan_type',
        :'sequence_number' => :'sequence_number',
        :'servicer_address' => :'servicer_address'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'type' => :'String',
        :'purchase_apr' => :'Float',
        :'cash_apr' => :'Float',
        :'balance_transfer_apr' => :'Float',
        :'special_apr' => :'Float',
        :'last_payment_amount' => :'Float',
        :'minimum_payment_amount' => :'Float',
        :'is_overdue' => :'Boolean',
        :'origination_date' => :'Date',
        :'principal' => :'Float',
        :'nominal_apr' => :'Float',
        :'interest_capitalization_grace_period_months' => :'Float',
        :'repayment_model' => :'StudentLoanRepaymentModel',
        :'expected_payoff_date' => :'Date',
        :'guarantor' => :'String',
        :'is_federal' => :'Boolean',
        :'loan_name' => :'String',
        :'loan_status' => :'StudentLoanStatus',
        :'payment_reference_number' => :'String',
        :'pslf_status' => :'PSLFStatus',
        :'repayment_plan_description' => :'String',
        :'repayment_plan_type' => :'String',
        :'sequence_number' => :'String',
        :'servicer_address' => :'Address'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::LiabilityOverride` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::LiabilityOverride`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.key?(:'purchase_apr')
        self.purchase_apr = attributes[:'purchase_apr']
      end

      if attributes.key?(:'cash_apr')
        self.cash_apr = attributes[:'cash_apr']
      end

      if attributes.key?(:'balance_transfer_apr')
        self.balance_transfer_apr = attributes[:'balance_transfer_apr']
      end

      if attributes.key?(:'special_apr')
        self.special_apr = attributes[:'special_apr']
      end

      if attributes.key?(:'last_payment_amount')
        self.last_payment_amount = attributes[:'last_payment_amount']
      end

      if attributes.key?(:'minimum_payment_amount')
        self.minimum_payment_amount = attributes[:'minimum_payment_amount']
      end

      if attributes.key?(:'is_overdue')
        self.is_overdue = attributes[:'is_overdue']
      end

      if attributes.key?(:'origination_date')
        self.origination_date = attributes[:'origination_date']
      end

      if attributes.key?(:'principal')
        self.principal = attributes[:'principal']
      end

      if attributes.key?(:'nominal_apr')
        self.nominal_apr = attributes[:'nominal_apr']
      end

      if attributes.key?(:'interest_capitalization_grace_period_months')
        self.interest_capitalization_grace_period_months = attributes[:'interest_capitalization_grace_period_months']
      end

      if attributes.key?(:'repayment_model')
        self.repayment_model = attributes[:'repayment_model']
      end

      if attributes.key?(:'expected_payoff_date')
        self.expected_payoff_date = attributes[:'expected_payoff_date']
      end

      if attributes.key?(:'guarantor')
        self.guarantor = attributes[:'guarantor']
      end

      if attributes.key?(:'is_federal')
        self.is_federal = attributes[:'is_federal']
      end

      if attributes.key?(:'loan_name')
        self.loan_name = attributes[:'loan_name']
      end

      if attributes.key?(:'loan_status')
        self.loan_status = attributes[:'loan_status']
      end

      if attributes.key?(:'payment_reference_number')
        self.payment_reference_number = attributes[:'payment_reference_number']
      end

      if attributes.key?(:'pslf_status')
        self.pslf_status = attributes[:'pslf_status']
      end

      if attributes.key?(:'repayment_plan_description')
        self.repayment_plan_description = attributes[:'repayment_plan_description']
      end

      if attributes.key?(:'repayment_plan_type')
        self.repayment_plan_type = attributes[:'repayment_plan_type']
      end

      if attributes.key?(:'sequence_number')
        self.sequence_number = attributes[:'sequence_number']
      end

      if attributes.key?(:'servicer_address')
        self.servicer_address = attributes[:'servicer_address']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @type.nil?
        invalid_properties.push('invalid value for "type", type cannot be nil.')
      end

      if @purchase_apr.nil?
        invalid_properties.push('invalid value for "purchase_apr", purchase_apr cannot be nil.')
      end

      if @cash_apr.nil?
        invalid_properties.push('invalid value for "cash_apr", cash_apr cannot be nil.')
      end

      if @balance_transfer_apr.nil?
        invalid_properties.push('invalid value for "balance_transfer_apr", balance_transfer_apr cannot be nil.')
      end

      if @special_apr.nil?
        invalid_properties.push('invalid value for "special_apr", special_apr cannot be nil.')
      end

      if @last_payment_amount.nil?
        invalid_properties.push('invalid value for "last_payment_amount", last_payment_amount cannot be nil.')
      end

      if @minimum_payment_amount.nil?
        invalid_properties.push('invalid value for "minimum_payment_amount", minimum_payment_amount cannot be nil.')
      end

      if @is_overdue.nil?
        invalid_properties.push('invalid value for "is_overdue", is_overdue cannot be nil.')
      end

      if @origination_date.nil?
        invalid_properties.push('invalid value for "origination_date", origination_date cannot be nil.')
      end

      if @principal.nil?
        invalid_properties.push('invalid value for "principal", principal cannot be nil.')
      end

      if @nominal_apr.nil?
        invalid_properties.push('invalid value for "nominal_apr", nominal_apr cannot be nil.')
      end

      if @interest_capitalization_grace_period_months.nil?
        invalid_properties.push('invalid value for "interest_capitalization_grace_period_months", interest_capitalization_grace_period_months cannot be nil.')
      end

      if @repayment_model.nil?
        invalid_properties.push('invalid value for "repayment_model", repayment_model cannot be nil.')
      end

      if @expected_payoff_date.nil?
        invalid_properties.push('invalid value for "expected_payoff_date", expected_payoff_date cannot be nil.')
      end

      if @guarantor.nil?
        invalid_properties.push('invalid value for "guarantor", guarantor cannot be nil.')
      end

      if @is_federal.nil?
        invalid_properties.push('invalid value for "is_federal", is_federal cannot be nil.')
      end

      if @loan_name.nil?
        invalid_properties.push('invalid value for "loan_name", loan_name cannot be nil.')
      end

      if @loan_status.nil?
        invalid_properties.push('invalid value for "loan_status", loan_status cannot be nil.')
      end

      if @payment_reference_number.nil?
        invalid_properties.push('invalid value for "payment_reference_number", payment_reference_number cannot be nil.')
      end

      if @pslf_status.nil?
        invalid_properties.push('invalid value for "pslf_status", pslf_status cannot be nil.')
      end

      if @repayment_plan_description.nil?
        invalid_properties.push('invalid value for "repayment_plan_description", repayment_plan_description cannot be nil.')
      end

      if @repayment_plan_type.nil?
        invalid_properties.push('invalid value for "repayment_plan_type", repayment_plan_type cannot be nil.')
      end

      if @sequence_number.nil?
        invalid_properties.push('invalid value for "sequence_number", sequence_number cannot be nil.')
      end

      if @servicer_address.nil?
        invalid_properties.push('invalid value for "servicer_address", servicer_address cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @type.nil?
      return false if @purchase_apr.nil?
      return false if @cash_apr.nil?
      return false if @balance_transfer_apr.nil?
      return false if @special_apr.nil?
      return false if @last_payment_amount.nil?
      return false if @minimum_payment_amount.nil?
      return false if @is_overdue.nil?
      return false if @origination_date.nil?
      return false if @principal.nil?
      return false if @nominal_apr.nil?
      return false if @interest_capitalization_grace_period_months.nil?
      return false if @repayment_model.nil?
      return false if @expected_payoff_date.nil?
      return false if @guarantor.nil?
      return false if @is_federal.nil?
      return false if @loan_name.nil?
      return false if @loan_status.nil?
      return false if @payment_reference_number.nil?
      return false if @pslf_status.nil?
      return false if @repayment_plan_description.nil?
      return false if @repayment_plan_type.nil?
      return false if @sequence_number.nil?
      return false if @servicer_address.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          type == o.type &&
          purchase_apr == o.purchase_apr &&
          cash_apr == o.cash_apr &&
          balance_transfer_apr == o.balance_transfer_apr &&
          special_apr == o.special_apr &&
          last_payment_amount == o.last_payment_amount &&
          minimum_payment_amount == o.minimum_payment_amount &&
          is_overdue == o.is_overdue &&
          origination_date == o.origination_date &&
          principal == o.principal &&
          nominal_apr == o.nominal_apr &&
          interest_capitalization_grace_period_months == o.interest_capitalization_grace_period_months &&
          repayment_model == o.repayment_model &&
          expected_payoff_date == o.expected_payoff_date &&
          guarantor == o.guarantor &&
          is_federal == o.is_federal &&
          loan_name == o.loan_name &&
          loan_status == o.loan_status &&
          payment_reference_number == o.payment_reference_number &&
          pslf_status == o.pslf_status &&
          repayment_plan_description == o.repayment_plan_description &&
          repayment_plan_type == o.repayment_plan_type &&
          sequence_number == o.sequence_number &&
          servicer_address == o.servicer_address
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [type, purchase_apr, cash_apr, balance_transfer_apr, special_apr, last_payment_amount, minimum_payment_amount, is_overdue, origination_date, principal, nominal_apr, interest_capitalization_grace_period_months, repayment_model, expected_payoff_date, guarantor, is_federal, loan_name, loan_status, payment_reference_number, pslf_status, repayment_plan_description, repayment_plan_type, sequence_number, servicer_address].hash
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
