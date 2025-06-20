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
  # Contains details about a mortgage account.
  class MortgageLiability
    # The ID of the account that this liability belongs to.
    attr_accessor :account_id

    # The account number of the loan.
    attr_accessor :account_number

    # The current outstanding amount charged for late payment.
    attr_accessor :current_late_fee

    # Total amount held in escrow to pay taxes and insurance on behalf of the borrower.
    attr_accessor :escrow_balance

    # Indicates whether the borrower has private mortgage insurance in effect.
    attr_accessor :has_pmi

    # Indicates whether the borrower will pay a penalty for early payoff of mortgage.
    attr_accessor :has_prepayment_penalty

    attr_accessor :interest_rate

    # The amount of the last payment.
    attr_accessor :last_payment_amount

    # The date of the last payment. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    attr_accessor :last_payment_date

    # Description of the type of loan, for example `conventional`, `fixed`, or `variable`. This field is provided directly from the loan servicer and does not have an enumerated set of possible values.
    attr_accessor :loan_type_description

    # Full duration of mortgage as at origination (e.g. `10 year`).
    attr_accessor :loan_term

    # Original date on which mortgage is due in full. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    attr_accessor :maturity_date

    # The amount of the next payment.
    attr_accessor :next_monthly_payment

    # The due date for the next payment. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    attr_accessor :next_payment_due_date

    # The date on which the loan was initially lent. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    attr_accessor :origination_date

    # The original principal balance of the mortgage.
    attr_accessor :origination_principal_amount

    # Amount of loan (principal + interest) past due for payment.
    attr_accessor :past_due_amount

    attr_accessor :property_address

    # The year to date (YTD) interest paid.
    attr_accessor :ytd_interest_paid

    # The YTD principal paid.
    attr_accessor :ytd_principal_paid

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'account_id' => :'account_id',
        :'account_number' => :'account_number',
        :'current_late_fee' => :'current_late_fee',
        :'escrow_balance' => :'escrow_balance',
        :'has_pmi' => :'has_pmi',
        :'has_prepayment_penalty' => :'has_prepayment_penalty',
        :'interest_rate' => :'interest_rate',
        :'last_payment_amount' => :'last_payment_amount',
        :'last_payment_date' => :'last_payment_date',
        :'loan_type_description' => :'loan_type_description',
        :'loan_term' => :'loan_term',
        :'maturity_date' => :'maturity_date',
        :'next_monthly_payment' => :'next_monthly_payment',
        :'next_payment_due_date' => :'next_payment_due_date',
        :'origination_date' => :'origination_date',
        :'origination_principal_amount' => :'origination_principal_amount',
        :'past_due_amount' => :'past_due_amount',
        :'property_address' => :'property_address',
        :'ytd_interest_paid' => :'ytd_interest_paid',
        :'ytd_principal_paid' => :'ytd_principal_paid'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'account_id' => :'String',
        :'account_number' => :'String',
        :'current_late_fee' => :'Float',
        :'escrow_balance' => :'Float',
        :'has_pmi' => :'Boolean',
        :'has_prepayment_penalty' => :'Boolean',
        :'interest_rate' => :'MortgageInterestRate',
        :'last_payment_amount' => :'Float',
        :'last_payment_date' => :'Date',
        :'loan_type_description' => :'String',
        :'loan_term' => :'String',
        :'maturity_date' => :'Date',
        :'next_monthly_payment' => :'Float',
        :'next_payment_due_date' => :'Date',
        :'origination_date' => :'Date',
        :'origination_principal_amount' => :'Float',
        :'past_due_amount' => :'Float',
        :'property_address' => :'MortgagePropertyAddress',
        :'ytd_interest_paid' => :'Float',
        :'ytd_principal_paid' => :'Float'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'account_number',
        :'current_late_fee',
        :'escrow_balance',
        :'has_pmi',
        :'has_prepayment_penalty',
        :'last_payment_amount',
        :'last_payment_date',
        :'loan_type_description',
        :'loan_term',
        :'maturity_date',
        :'next_monthly_payment',
        :'next_payment_due_date',
        :'origination_date',
        :'origination_principal_amount',
        :'past_due_amount',
        :'ytd_interest_paid',
        :'ytd_principal_paid'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::MortgageLiability` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::MortgageLiability`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'account_id')
        self.account_id = attributes[:'account_id']
      end

      if attributes.key?(:'account_number')
        self.account_number = attributes[:'account_number']
      end

      if attributes.key?(:'current_late_fee')
        self.current_late_fee = attributes[:'current_late_fee']
      end

      if attributes.key?(:'escrow_balance')
        self.escrow_balance = attributes[:'escrow_balance']
      end

      if attributes.key?(:'has_pmi')
        self.has_pmi = attributes[:'has_pmi']
      end

      if attributes.key?(:'has_prepayment_penalty')
        self.has_prepayment_penalty = attributes[:'has_prepayment_penalty']
      end

      if attributes.key?(:'interest_rate')
        self.interest_rate = attributes[:'interest_rate']
      end

      if attributes.key?(:'last_payment_amount')
        self.last_payment_amount = attributes[:'last_payment_amount']
      end

      if attributes.key?(:'last_payment_date')
        self.last_payment_date = attributes[:'last_payment_date']
      end

      if attributes.key?(:'loan_type_description')
        self.loan_type_description = attributes[:'loan_type_description']
      end

      if attributes.key?(:'loan_term')
        self.loan_term = attributes[:'loan_term']
      end

      if attributes.key?(:'maturity_date')
        self.maturity_date = attributes[:'maturity_date']
      end

      if attributes.key?(:'next_monthly_payment')
        self.next_monthly_payment = attributes[:'next_monthly_payment']
      end

      if attributes.key?(:'next_payment_due_date')
        self.next_payment_due_date = attributes[:'next_payment_due_date']
      end

      if attributes.key?(:'origination_date')
        self.origination_date = attributes[:'origination_date']
      end

      if attributes.key?(:'origination_principal_amount')
        self.origination_principal_amount = attributes[:'origination_principal_amount']
      end

      if attributes.key?(:'past_due_amount')
        self.past_due_amount = attributes[:'past_due_amount']
      end

      if attributes.key?(:'property_address')
        self.property_address = attributes[:'property_address']
      end

      if attributes.key?(:'ytd_interest_paid')
        self.ytd_interest_paid = attributes[:'ytd_interest_paid']
      end

      if attributes.key?(:'ytd_principal_paid')
        self.ytd_principal_paid = attributes[:'ytd_principal_paid']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @account_id.nil?
        invalid_properties.push('invalid value for "account_id", account_id cannot be nil.')
      end

      if @interest_rate.nil?
        invalid_properties.push('invalid value for "interest_rate", interest_rate cannot be nil.')
      end

      if @property_address.nil?
        invalid_properties.push('invalid value for "property_address", property_address cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @account_id.nil?
      return false if @interest_rate.nil?
      return false if @property_address.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          account_id == o.account_id &&
          account_number == o.account_number &&
          current_late_fee == o.current_late_fee &&
          escrow_balance == o.escrow_balance &&
          has_pmi == o.has_pmi &&
          has_prepayment_penalty == o.has_prepayment_penalty &&
          interest_rate == o.interest_rate &&
          last_payment_amount == o.last_payment_amount &&
          last_payment_date == o.last_payment_date &&
          loan_type_description == o.loan_type_description &&
          loan_term == o.loan_term &&
          maturity_date == o.maturity_date &&
          next_monthly_payment == o.next_monthly_payment &&
          next_payment_due_date == o.next_payment_due_date &&
          origination_date == o.origination_date &&
          origination_principal_amount == o.origination_principal_amount &&
          past_due_amount == o.past_due_amount &&
          property_address == o.property_address &&
          ytd_interest_paid == o.ytd_interest_paid &&
          ytd_principal_paid == o.ytd_principal_paid
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [account_id, account_number, current_late_fee, escrow_balance, has_pmi, has_prepayment_penalty, interest_rate, last_payment_amount, last_payment_date, loan_type_description, loan_term, maturity_date, next_monthly_payment, next_payment_due_date, origination_date, origination_principal_amount, past_due_amount, property_address, ytd_interest_paid, ytd_principal_paid].hash
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
