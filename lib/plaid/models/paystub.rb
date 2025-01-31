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
  # An object representing data extracted from the end user's paystub.
  class Paystub
    attr_accessor :deductions

    # An identifier of the document referenced by the document metadata.
    attr_accessor :doc_id

    attr_accessor :earnings

    attr_accessor :employee

    attr_accessor :employer

    attr_accessor :employment_details

    attr_accessor :net_pay

    attr_accessor :pay_period_details

    attr_accessor :paystub_details

    attr_accessor :income_breakdown

    attr_accessor :ytd_earnings

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'deductions' => :'deductions',
        :'doc_id' => :'doc_id',
        :'earnings' => :'earnings',
        :'employee' => :'employee',
        :'employer' => :'employer',
        :'employment_details' => :'employment_details',
        :'net_pay' => :'net_pay',
        :'pay_period_details' => :'pay_period_details',
        :'paystub_details' => :'paystub_details',
        :'income_breakdown' => :'income_breakdown',
        :'ytd_earnings' => :'ytd_earnings'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'deductions' => :'Deductions',
        :'doc_id' => :'String',
        :'earnings' => :'Earnings',
        :'employee' => :'Employee',
        :'employer' => :'PaystubEmployer',
        :'employment_details' => :'EmploymentDetails',
        :'net_pay' => :'NetPay',
        :'pay_period_details' => :'PayPeriodDetails',
        :'paystub_details' => :'PaystubDetails',
        :'income_breakdown' => :'Array<IncomeBreakdown>',
        :'ytd_earnings' => :'PaystubYTDDetails'
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
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::Paystub` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::Paystub`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'deductions')
        self.deductions = attributes[:'deductions']
      end

      if attributes.key?(:'doc_id')
        self.doc_id = attributes[:'doc_id']
      end

      if attributes.key?(:'earnings')
        self.earnings = attributes[:'earnings']
      end

      if attributes.key?(:'employee')
        self.employee = attributes[:'employee']
      end

      if attributes.key?(:'employer')
        self.employer = attributes[:'employer']
      end

      if attributes.key?(:'employment_details')
        self.employment_details = attributes[:'employment_details']
      end

      if attributes.key?(:'net_pay')
        self.net_pay = attributes[:'net_pay']
      end

      if attributes.key?(:'pay_period_details')
        self.pay_period_details = attributes[:'pay_period_details']
      end

      if attributes.key?(:'paystub_details')
        self.paystub_details = attributes[:'paystub_details']
      end

      if attributes.key?(:'income_breakdown')
        if (value = attributes[:'income_breakdown']).is_a?(Array)
          self.income_breakdown = value
        end
      end

      if attributes.key?(:'ytd_earnings')
        self.ytd_earnings = attributes[:'ytd_earnings']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @deductions.nil?
        invalid_properties.push('invalid value for "deductions", deductions cannot be nil.')
      end

      if @doc_id.nil?
        invalid_properties.push('invalid value for "doc_id", doc_id cannot be nil.')
      end

      if @earnings.nil?
        invalid_properties.push('invalid value for "earnings", earnings cannot be nil.')
      end

      if @employee.nil?
        invalid_properties.push('invalid value for "employee", employee cannot be nil.')
      end

      if @employer.nil?
        invalid_properties.push('invalid value for "employer", employer cannot be nil.')
      end

      if @net_pay.nil?
        invalid_properties.push('invalid value for "net_pay", net_pay cannot be nil.')
      end

      if @pay_period_details.nil?
        invalid_properties.push('invalid value for "pay_period_details", pay_period_details cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @deductions.nil?
      return false if @doc_id.nil?
      return false if @earnings.nil?
      return false if @employee.nil?
      return false if @employer.nil?
      return false if @net_pay.nil?
      return false if @pay_period_details.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          deductions == o.deductions &&
          doc_id == o.doc_id &&
          earnings == o.earnings &&
          employee == o.employee &&
          employer == o.employer &&
          employment_details == o.employment_details &&
          net_pay == o.net_pay &&
          pay_period_details == o.pay_period_details &&
          paystub_details == o.paystub_details &&
          income_breakdown == o.income_breakdown &&
          ytd_earnings == o.ytd_earnings
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [deductions, doc_id, earnings, employee, employer, employment_details, net_pay, pay_period_details, paystub_details, income_breakdown, ytd_earnings].hash
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
