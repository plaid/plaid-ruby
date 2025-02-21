=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.620.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  # Contains details about a student loan account
  class StudentLoan
    # The ID of the account that this liability belongs to. Each account can only contain one liability.
    attr_accessor :account_id

    # The account number of the loan. For some institutions, this may be a masked version of the number (e.g., the last 4 digits instead of the entire number).
    attr_accessor :account_number

    # The dates on which loaned funds were disbursed or will be disbursed. These are often in the past. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    attr_accessor :disbursement_dates

    # The date when the student loan is expected to be paid off. Availability for this field is limited. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    attr_accessor :expected_payoff_date

    # The guarantor of the student loan.
    attr_accessor :guarantor

    # The interest rate on the loan as a percentage.
    attr_accessor :interest_rate_percentage

    # `true` if a payment is currently overdue. Availability for this field is limited.
    attr_accessor :is_overdue

    # The amount of the last payment.
    attr_accessor :last_payment_amount

    # The date of the last payment. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    attr_accessor :last_payment_date

    # The total amount owed as of the last statement issued
    attr_accessor :last_statement_balance

    # The date of the last statement. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    attr_accessor :last_statement_issue_date

    # The type of loan, e.g., \"Consolidation Loans\".
    attr_accessor :loan_name

    attr_accessor :loan_status

    # The minimum payment due for the next billing cycle. There are some exceptions: Some institutions require a minimum payment across all loans associated with an account number. Our API presents that same minimum payment amount on each loan. The institutions that do this are: Great Lakes ( `ins_116861`), Firstmark (`ins_116295`), Commonbond Firstmark Services (`ins_116950`), Granite State (`ins_116308`), and Oklahoma Student Loan Authority (`ins_116945`). Firstmark (`ins_116295` ) and Navient (`ins_116248`) will display as $0 if there is an autopay program in effect.
    attr_accessor :minimum_payment_amount

    # The due date for the next payment. The due date is `null` if a payment is not expected. A payment is not expected if `loan_status.type` is `deferment`, `in_school`, `consolidated`, `paid in full`, or `transferred`. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD).
    attr_accessor :next_payment_due_date

    # The date on which the loan was initially lent. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format (YYYY-MM-DD). 
    attr_accessor :origination_date

    # The original principal balance of the loan.
    attr_accessor :origination_principal_amount

    # The total dollar amount of the accrued interest balance. For Sallie Mae ( `ins_116944`), this amount is included in the current balance of the loan, so this field will return as `null`.
    attr_accessor :outstanding_interest_amount

    # The relevant account number that should be used to reference this loan for payments. In the majority of cases, `payment_reference_number` will match `account_number,` but in some institutions, such as Great Lakes (`ins_116861`), it will be different.
    attr_accessor :payment_reference_number

    attr_accessor :pslf_status

    attr_accessor :repayment_plan

    # The sequence number of the student loan. Heartland ECSI (`ins_116948`) does not make this field available.
    attr_accessor :sequence_number

    attr_accessor :servicer_address

    # The year to date (YTD) interest paid. Availability for this field is limited.
    attr_accessor :ytd_interest_paid

    # The year to date (YTD) principal paid. Availability for this field is limited.
    attr_accessor :ytd_principal_paid

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'account_id' => :'account_id',
        :'account_number' => :'account_number',
        :'disbursement_dates' => :'disbursement_dates',
        :'expected_payoff_date' => :'expected_payoff_date',
        :'guarantor' => :'guarantor',
        :'interest_rate_percentage' => :'interest_rate_percentage',
        :'is_overdue' => :'is_overdue',
        :'last_payment_amount' => :'last_payment_amount',
        :'last_payment_date' => :'last_payment_date',
        :'last_statement_balance' => :'last_statement_balance',
        :'last_statement_issue_date' => :'last_statement_issue_date',
        :'loan_name' => :'loan_name',
        :'loan_status' => :'loan_status',
        :'minimum_payment_amount' => :'minimum_payment_amount',
        :'next_payment_due_date' => :'next_payment_due_date',
        :'origination_date' => :'origination_date',
        :'origination_principal_amount' => :'origination_principal_amount',
        :'outstanding_interest_amount' => :'outstanding_interest_amount',
        :'payment_reference_number' => :'payment_reference_number',
        :'pslf_status' => :'pslf_status',
        :'repayment_plan' => :'repayment_plan',
        :'sequence_number' => :'sequence_number',
        :'servicer_address' => :'servicer_address',
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
        :'disbursement_dates' => :'Array<Date>',
        :'expected_payoff_date' => :'Date',
        :'guarantor' => :'String',
        :'interest_rate_percentage' => :'Float',
        :'is_overdue' => :'Boolean',
        :'last_payment_amount' => :'Float',
        :'last_payment_date' => :'Date',
        :'last_statement_balance' => :'Float',
        :'last_statement_issue_date' => :'Date',
        :'loan_name' => :'String',
        :'loan_status' => :'StudentLoanStatus',
        :'minimum_payment_amount' => :'Float',
        :'next_payment_due_date' => :'Date',
        :'origination_date' => :'Date',
        :'origination_principal_amount' => :'Float',
        :'outstanding_interest_amount' => :'Float',
        :'payment_reference_number' => :'String',
        :'pslf_status' => :'PSLFStatus',
        :'repayment_plan' => :'StudentRepaymentPlan',
        :'sequence_number' => :'String',
        :'servicer_address' => :'ServicerAddressData',
        :'ytd_interest_paid' => :'Float',
        :'ytd_principal_paid' => :'Float'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'account_id',
        :'account_number',
        :'disbursement_dates',
        :'expected_payoff_date',
        :'guarantor',
        :'is_overdue',
        :'last_payment_amount',
        :'last_payment_date',
        :'last_statement_balance',
        :'last_statement_issue_date',
        :'loan_name',
        :'minimum_payment_amount',
        :'next_payment_due_date',
        :'origination_date',
        :'origination_principal_amount',
        :'outstanding_interest_amount',
        :'payment_reference_number',
        :'sequence_number',
        :'ytd_interest_paid',
        :'ytd_principal_paid'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::StudentLoan` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::StudentLoan`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'account_id')
        self.account_id = attributes[:'account_id']
      end

      if attributes.key?(:'account_number')
        self.account_number = attributes[:'account_number']
      end

      if attributes.key?(:'disbursement_dates')
        if (value = attributes[:'disbursement_dates']).is_a?(Array)
          self.disbursement_dates = value
        end
      end

      if attributes.key?(:'expected_payoff_date')
        self.expected_payoff_date = attributes[:'expected_payoff_date']
      end

      if attributes.key?(:'guarantor')
        self.guarantor = attributes[:'guarantor']
      end

      if attributes.key?(:'interest_rate_percentage')
        self.interest_rate_percentage = attributes[:'interest_rate_percentage']
      end

      if attributes.key?(:'is_overdue')
        self.is_overdue = attributes[:'is_overdue']
      end

      if attributes.key?(:'last_payment_amount')
        self.last_payment_amount = attributes[:'last_payment_amount']
      end

      if attributes.key?(:'last_payment_date')
        self.last_payment_date = attributes[:'last_payment_date']
      end

      if attributes.key?(:'last_statement_balance')
        self.last_statement_balance = attributes[:'last_statement_balance']
      end

      if attributes.key?(:'last_statement_issue_date')
        self.last_statement_issue_date = attributes[:'last_statement_issue_date']
      end

      if attributes.key?(:'loan_name')
        self.loan_name = attributes[:'loan_name']
      end

      if attributes.key?(:'loan_status')
        self.loan_status = attributes[:'loan_status']
      end

      if attributes.key?(:'minimum_payment_amount')
        self.minimum_payment_amount = attributes[:'minimum_payment_amount']
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

      if attributes.key?(:'outstanding_interest_amount')
        self.outstanding_interest_amount = attributes[:'outstanding_interest_amount']
      end

      if attributes.key?(:'payment_reference_number')
        self.payment_reference_number = attributes[:'payment_reference_number']
      end

      if attributes.key?(:'pslf_status')
        self.pslf_status = attributes[:'pslf_status']
      end

      if attributes.key?(:'repayment_plan')
        self.repayment_plan = attributes[:'repayment_plan']
      end

      if attributes.key?(:'sequence_number')
        self.sequence_number = attributes[:'sequence_number']
      end

      if attributes.key?(:'servicer_address')
        self.servicer_address = attributes[:'servicer_address']
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
      if @interest_rate_percentage.nil?
        invalid_properties.push('invalid value for "interest_rate_percentage", interest_rate_percentage cannot be nil.')
      end

      if @loan_status.nil?
        invalid_properties.push('invalid value for "loan_status", loan_status cannot be nil.')
      end

      if @pslf_status.nil?
        invalid_properties.push('invalid value for "pslf_status", pslf_status cannot be nil.')
      end

      if @repayment_plan.nil?
        invalid_properties.push('invalid value for "repayment_plan", repayment_plan cannot be nil.')
      end

      if @servicer_address.nil?
        invalid_properties.push('invalid value for "servicer_address", servicer_address cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @interest_rate_percentage.nil?
      return false if @loan_status.nil?
      return false if @pslf_status.nil?
      return false if @repayment_plan.nil?
      return false if @servicer_address.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          account_id == o.account_id &&
          account_number == o.account_number &&
          disbursement_dates == o.disbursement_dates &&
          expected_payoff_date == o.expected_payoff_date &&
          guarantor == o.guarantor &&
          interest_rate_percentage == o.interest_rate_percentage &&
          is_overdue == o.is_overdue &&
          last_payment_amount == o.last_payment_amount &&
          last_payment_date == o.last_payment_date &&
          last_statement_balance == o.last_statement_balance &&
          last_statement_issue_date == o.last_statement_issue_date &&
          loan_name == o.loan_name &&
          loan_status == o.loan_status &&
          minimum_payment_amount == o.minimum_payment_amount &&
          next_payment_due_date == o.next_payment_due_date &&
          origination_date == o.origination_date &&
          origination_principal_amount == o.origination_principal_amount &&
          outstanding_interest_amount == o.outstanding_interest_amount &&
          payment_reference_number == o.payment_reference_number &&
          pslf_status == o.pslf_status &&
          repayment_plan == o.repayment_plan &&
          sequence_number == o.sequence_number &&
          servicer_address == o.servicer_address &&
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
      [account_id, account_number, disbursement_dates, expected_payoff_date, guarantor, interest_rate_percentage, is_overdue, last_payment_amount, last_payment_date, last_statement_balance, last_statement_issue_date, loan_name, loan_status, minimum_payment_amount, next_payment_due_date, origination_date, origination_principal_amount, outstanding_interest_amount, payment_reference_number, pslf_status, repayment_plan, sequence_number, servicer_address, ytd_interest_paid, ytd_principal_paid].hash
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
