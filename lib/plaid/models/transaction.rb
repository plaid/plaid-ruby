=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.610.2

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  # A representation of a transaction
  class Transaction
    # The ID of the account in which this transaction occurred.
    attr_accessor :account_id

    # The settled value of the transaction, denominated in the transactions's currency, as stated in `iso_currency_code` or `unofficial_currency_code`. For all products except Income: Positive values when money moves out of the account; negative values when money moves in. For example, debit card purchases are positive; credit card payments, direct deposits, and refunds are negative. For Income endpoints, values are positive when representing income.
    attr_accessor :amount

    # The ISO-4217 currency code of the transaction. Always `null` if `unofficial_currency_code` is non-null.
    attr_accessor :iso_currency_code

    # The unofficial currency code associated with the transaction. Always `null` if `iso_currency_code` is non-`null`. Unofficial currency codes are used for currencies that do not have official ISO currency codes, such as cryptocurrencies and the currencies of certain countries.  See the [currency code schema](https://plaid.com/docs/api/accounts#currency-code-schema) for a full listing of supported `iso_currency_code`s.
    attr_accessor :unofficial_currency_code

    # A hierarchical array of the categories to which this transaction belongs. For a full list of categories, see [`/categories/get`](https://plaid.com/docs/api/products/transactions/#categoriesget).  All Transactions implementations are recommended to use the new `personal_finance_category` instead of `category`, as it provides greater accuracy and more meaningful categorization.  If the `transactions` object was returned by an Assets endpoint such as `/asset_report/get/` or `/asset_report/pdf/get`, this field will only appear in an Asset Report with Insights.
    attr_accessor :category

    # The ID of the category to which this transaction belongs. For a full list of categories, see [`/categories/get`](https://plaid.com/docs/api/products/transactions/#categoriesget).  All Transactions implementations are recommended to use the new `personal_finance_category` instead of `category`, as it provides greater accuracy and more meaningful categorization.  If the `transactions` object was returned by an Assets endpoint such as `/asset_report/get/` or `/asset_report/pdf/get`, this field will only appear in an Asset Report with Insights.
    attr_accessor :category_id

    # The check number of the transaction. This field is only populated for check transactions.
    attr_accessor :check_number

    # For pending transactions, the date that the transaction occurred; for posted transactions, the date that the transaction posted. Both dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format ( `YYYY-MM-DD` ). To receive information about the date that a posted transaction was initiated, see the `authorized_date` field.
    attr_accessor :date

    attr_accessor :location

    # The merchant name or transaction description.   Note: This is a legacy field that is not actively maintained. Use `merchant_name` instead for the merchant name.  If the `transactions` object was returned by a Transactions endpoint such as `/transactions/sync` or `/transactions/get`, this field will always appear. If the `transactions` object was returned by an Assets endpoint such as `/asset_report/get/` or `/asset_report/pdf/get`, this field will only appear in an Asset Report with Insights.
    attr_accessor :name

    # The merchant name, as enriched by Plaid from the `name` field. This is typically a more human-readable version of the merchant counterparty in the transaction. For some bank transactions (such as checks or account transfers) where there is no meaningful merchant name, this value will be `null`.
    attr_accessor :merchant_name

    # The string returned by the financial institution to describe the transaction. For transactions returned by `/transactions/sync` or `/transactions/get`, this field will only be included if the client has set `options.include_original_description` to `true`.
    attr_accessor :original_description

    attr_accessor :payment_meta

    # When `true`, identifies the transaction as pending or unsettled. Pending transaction details (name, type, amount, category ID) may change before they are settled. Not all institutions provide pending transactions.
    attr_accessor :pending

    # The ID of a posted transaction's associated pending transaction, where applicable. Not all institutions provide pending transactions.
    attr_accessor :pending_transaction_id

    # This field is not typically populated and only relevant when dealing with sub-accounts. A sub-account most commonly exists in cases where a single account is linked to multiple cards, each with its own card number and card holder name; each card will be considered a sub-account. If the account does have sub-accounts, this field will typically be some combination of the sub-account owner's name and/or the sub-account mask. The format of this field is not standardized and will vary based on institution.
    attr_accessor :account_owner

    # The unique ID of the transaction. Like all Plaid identifiers, the `transaction_id` is case sensitive.
    attr_accessor :transaction_id

    # Please use the `payment_channel` field, `transaction_type` will be deprecated in the future.  `digital:` transactions that took place online.  `place:` transactions that were made at a physical location.  `special:` transactions that relate to banks, e.g. fees or deposits.  `unresolved:` transactions that do not fit into the other three types. 
    attr_accessor :transaction_type

    # The URL of a logo associated with this transaction, if available. The logo will always be 100×100 pixel PNG file.
    attr_accessor :logo_url

    # The website associated with this transaction, if available.
    attr_accessor :website

    # The date that the transaction was authorized. For posted transactions, the `date` field will indicate the posted date, but `authorized_date` will indicate the day the transaction was authorized by the financial institution. If presenting transactions to the user in a UI, the `authorized_date`, when available, is generally preferable to use over the `date` field for posted transactions, as it will generally represent the date the user actually made the transaction. Dates are returned in an [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format ( `YYYY-MM-DD` ).
    attr_accessor :authorized_date

    # Date and time when a transaction was authorized in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format ( `YYYY-MM-DDTHH:mm:ssZ` ). For posted transactions, the `datetime` field will indicate the posted date, but `authorized_datetime` will indicate the day the transaction was authorized by the financial institution. If presenting transactions to the user in a UI, the `authorized_datetime`, when available, is generally preferable to use over the `datetime` field for posted transactions, as it will generally represent the date the user actually made the transaction.  This field is returned for select financial institutions and comes as provided by the institution. It may contain default time values (such as 00:00:00). This field is only populated in API version 2019-05-29 and later.
    attr_accessor :authorized_datetime

    # Date and time when a transaction was posted in [ISO 8601](https://wikipedia.org/wiki/ISO_8601) format ( `YYYY-MM-DDTHH:mm:ssZ` ). For the date that the transaction was initiated, rather than posted, see the `authorized_datetime` field.  This field is returned for select financial institutions and comes as provided by the institution. It may contain default time values (such as 00:00:00). This field is only populated in API version 2019-05-29 and later.
    attr_accessor :datetime

    # The channel used to make a payment. `online:` transactions that took place online.  `in store:` transactions that were made at a physical location.  `other:` transactions that relate to banks, e.g. fees or deposits.  This field replaces the `transaction_type` field. 
    attr_accessor :payment_channel

    attr_accessor :personal_finance_category

    attr_accessor :transaction_code

    # The URL of an icon associated with the primary personal finance category. The icon will always be 100×100 pixel PNG file.
    attr_accessor :personal_finance_category_icon_url

    # The counterparties present in the transaction. Counterparties, such as the merchant or the financial institution, are extracted by Plaid from the raw description.
    attr_accessor :counterparties

    # A unique, stable, Plaid-generated ID that maps to the merchant. In the case of a merchant with multiple retail locations, this field will map to the broader merchant, not a specific location or store.
    attr_accessor :merchant_entity_id

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
        :'account_id' => :'account_id',
        :'amount' => :'amount',
        :'iso_currency_code' => :'iso_currency_code',
        :'unofficial_currency_code' => :'unofficial_currency_code',
        :'category' => :'category',
        :'category_id' => :'category_id',
        :'check_number' => :'check_number',
        :'date' => :'date',
        :'location' => :'location',
        :'name' => :'name',
        :'merchant_name' => :'merchant_name',
        :'original_description' => :'original_description',
        :'payment_meta' => :'payment_meta',
        :'pending' => :'pending',
        :'pending_transaction_id' => :'pending_transaction_id',
        :'account_owner' => :'account_owner',
        :'transaction_id' => :'transaction_id',
        :'transaction_type' => :'transaction_type',
        :'logo_url' => :'logo_url',
        :'website' => :'website',
        :'authorized_date' => :'authorized_date',
        :'authorized_datetime' => :'authorized_datetime',
        :'datetime' => :'datetime',
        :'payment_channel' => :'payment_channel',
        :'personal_finance_category' => :'personal_finance_category',
        :'transaction_code' => :'transaction_code',
        :'personal_finance_category_icon_url' => :'personal_finance_category_icon_url',
        :'counterparties' => :'counterparties',
        :'merchant_entity_id' => :'merchant_entity_id'
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
        :'amount' => :'Float',
        :'iso_currency_code' => :'String',
        :'unofficial_currency_code' => :'String',
        :'category' => :'Array<String>',
        :'category_id' => :'String',
        :'check_number' => :'String',
        :'date' => :'Date',
        :'location' => :'Location',
        :'name' => :'String',
        :'merchant_name' => :'String',
        :'original_description' => :'String',
        :'payment_meta' => :'PaymentMeta',
        :'pending' => :'Boolean',
        :'pending_transaction_id' => :'String',
        :'account_owner' => :'String',
        :'transaction_id' => :'String',
        :'transaction_type' => :'String',
        :'logo_url' => :'String',
        :'website' => :'String',
        :'authorized_date' => :'Date',
        :'authorized_datetime' => :'Time',
        :'datetime' => :'Time',
        :'payment_channel' => :'String',
        :'personal_finance_category' => :'PersonalFinanceCategory',
        :'transaction_code' => :'TransactionCode',
        :'personal_finance_category_icon_url' => :'String',
        :'counterparties' => :'Array<TransactionCounterparty>',
        :'merchant_entity_id' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'iso_currency_code',
        :'unofficial_currency_code',
        :'category',
        :'category_id',
        :'check_number',
        :'merchant_name',
        :'original_description',
        :'pending_transaction_id',
        :'account_owner',
        :'logo_url',
        :'website',
        :'authorized_date',
        :'authorized_datetime',
        :'datetime',
        :'personal_finance_category',
        :'transaction_code',
        :'merchant_entity_id'
      ])
    end

    # List of class defined in allOf (OpenAPI v3)
    def self.openapi_all_of
      [
      :'TransactionAllOf',
      :'TransactionBase'
      ]
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Plaid::Transaction` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Plaid::Transaction`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'account_id')
        self.account_id = attributes[:'account_id']
      end

      if attributes.key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.key?(:'iso_currency_code')
        self.iso_currency_code = attributes[:'iso_currency_code']
      end

      if attributes.key?(:'unofficial_currency_code')
        self.unofficial_currency_code = attributes[:'unofficial_currency_code']
      end

      if attributes.key?(:'category')
        if (value = attributes[:'category']).is_a?(Array)
          self.category = value
        end
      end

      if attributes.key?(:'category_id')
        self.category_id = attributes[:'category_id']
      end

      if attributes.key?(:'check_number')
        self.check_number = attributes[:'check_number']
      end

      if attributes.key?(:'date')
        self.date = attributes[:'date']
      end

      if attributes.key?(:'location')
        self.location = attributes[:'location']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'merchant_name')
        self.merchant_name = attributes[:'merchant_name']
      end

      if attributes.key?(:'original_description')
        self.original_description = attributes[:'original_description']
      end

      if attributes.key?(:'payment_meta')
        self.payment_meta = attributes[:'payment_meta']
      end

      if attributes.key?(:'pending')
        self.pending = attributes[:'pending']
      end

      if attributes.key?(:'pending_transaction_id')
        self.pending_transaction_id = attributes[:'pending_transaction_id']
      end

      if attributes.key?(:'account_owner')
        self.account_owner = attributes[:'account_owner']
      end

      if attributes.key?(:'transaction_id')
        self.transaction_id = attributes[:'transaction_id']
      end

      if attributes.key?(:'transaction_type')
        self.transaction_type = attributes[:'transaction_type']
      end

      if attributes.key?(:'logo_url')
        self.logo_url = attributes[:'logo_url']
      end

      if attributes.key?(:'website')
        self.website = attributes[:'website']
      end

      if attributes.key?(:'authorized_date')
        self.authorized_date = attributes[:'authorized_date']
      end

      if attributes.key?(:'authorized_datetime')
        self.authorized_datetime = attributes[:'authorized_datetime']
      end

      if attributes.key?(:'datetime')
        self.datetime = attributes[:'datetime']
      end

      if attributes.key?(:'payment_channel')
        self.payment_channel = attributes[:'payment_channel']
      end

      if attributes.key?(:'personal_finance_category')
        self.personal_finance_category = attributes[:'personal_finance_category']
      end

      if attributes.key?(:'transaction_code')
        self.transaction_code = attributes[:'transaction_code']
      end

      if attributes.key?(:'personal_finance_category_icon_url')
        self.personal_finance_category_icon_url = attributes[:'personal_finance_category_icon_url']
      end

      if attributes.key?(:'counterparties')
        if (value = attributes[:'counterparties']).is_a?(Array)
          self.counterparties = value
        end
      end

      if attributes.key?(:'merchant_entity_id')
        self.merchant_entity_id = attributes[:'merchant_entity_id']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @account_id.nil?
        invalid_properties.push('invalid value for "account_id", account_id cannot be nil.')
      end

      if @amount.nil?
        invalid_properties.push('invalid value for "amount", amount cannot be nil.')
      end

      if @date.nil?
        invalid_properties.push('invalid value for "date", date cannot be nil.')
      end

      if @location.nil?
        invalid_properties.push('invalid value for "location", location cannot be nil.')
      end

      if @name.nil?
        invalid_properties.push('invalid value for "name", name cannot be nil.')
      end

      if @payment_meta.nil?
        invalid_properties.push('invalid value for "payment_meta", payment_meta cannot be nil.')
      end

      if @pending.nil?
        invalid_properties.push('invalid value for "pending", pending cannot be nil.')
      end

      if @transaction_id.nil?
        invalid_properties.push('invalid value for "transaction_id", transaction_id cannot be nil.')
      end

      if @payment_channel.nil?
        invalid_properties.push('invalid value for "payment_channel", payment_channel cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @account_id.nil?
      return false if @amount.nil?
      return false if @date.nil?
      return false if @location.nil?
      return false if @name.nil?
      return false if @payment_meta.nil?
      return false if @pending.nil?
      return false if @transaction_id.nil?
      transaction_type_validator = EnumAttributeValidator.new('String', ["digital", "place", "special", "unresolved"])
      return false unless transaction_type_validator.valid?(@transaction_type)
      return false if @payment_channel.nil?
      payment_channel_validator = EnumAttributeValidator.new('String', ["online", "in store", "other"])
      return false unless payment_channel_validator.valid?(@payment_channel)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] transaction_type Object to be assigned
    def transaction_type=(transaction_type)
      validator = EnumAttributeValidator.new('String', ["digital", "place", "special", "unresolved"])
      unless validator.valid?(transaction_type)
        fail ArgumentError, "invalid value for \"transaction_type\", must be one of #{validator.allowable_values}."
      end
      @transaction_type = transaction_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] payment_channel Object to be assigned
    def payment_channel=(payment_channel)
      validator = EnumAttributeValidator.new('String', ["online", "in store", "other"])
      unless validator.valid?(payment_channel)
        fail ArgumentError, "invalid value for \"payment_channel\", must be one of #{validator.allowable_values}."
      end
      @payment_channel = payment_channel
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          account_id == o.account_id &&
          amount == o.amount &&
          iso_currency_code == o.iso_currency_code &&
          unofficial_currency_code == o.unofficial_currency_code &&
          category == o.category &&
          category_id == o.category_id &&
          check_number == o.check_number &&
          date == o.date &&
          location == o.location &&
          name == o.name &&
          merchant_name == o.merchant_name &&
          original_description == o.original_description &&
          payment_meta == o.payment_meta &&
          pending == o.pending &&
          pending_transaction_id == o.pending_transaction_id &&
          account_owner == o.account_owner &&
          transaction_id == o.transaction_id &&
          transaction_type == o.transaction_type &&
          logo_url == o.logo_url &&
          website == o.website &&
          authorized_date == o.authorized_date &&
          authorized_datetime == o.authorized_datetime &&
          datetime == o.datetime &&
          payment_channel == o.payment_channel &&
          personal_finance_category == o.personal_finance_category &&
          transaction_code == o.transaction_code &&
          personal_finance_category_icon_url == o.personal_finance_category_icon_url &&
          counterparties == o.counterparties &&
          merchant_entity_id == o.merchant_entity_id
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [account_id, amount, iso_currency_code, unofficial_currency_code, category, category_id, check_number, date, location, name, merchant_name, original_description, payment_meta, pending, pending_transaction_id, account_owner, transaction_id, transaction_type, logo_url, website, authorized_date, authorized_datetime, datetime, payment_channel, personal_finance_category, transaction_code, personal_finance_category_icon_url, counterparties, merchant_entity_id].hash
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
