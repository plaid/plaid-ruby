=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.33.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.1.0

=end

require 'date'
require 'time'

module Plaid
  class Products
    ASSETS = "assets".freeze
    AUTH = "auth".freeze
    BALANCE = "balance".freeze
    IDENTITY = "identity".freeze
    INVESTMENTS = "investments".freeze
    LIABILITIES = "liabilities".freeze
    PAYMENT_INITIATION = "payment_initiation".freeze
    TRANSACTIONS = "transactions".freeze
    CREDIT_DETAILS = "credit_details".freeze
    INCOME = "income".freeze
    INCOME_VERIFICATION = "income_verification".freeze
    DEPOSIT_SWITCH = "deposit_switch".freeze
    STANDING_ORDERS = "standing_orders".freeze
    TRANSFER = "transfer".freeze

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def self.build_from_hash(value)
      new.build_from_hash(value)
    end

    # Builds the enum from string
    # @param [String] The enum value in the form of the string
    # @return [String] The enum value
    def build_from_hash(value)
      constantValues = Products.constants.select { |c| Products::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #Products" if constantValues.empty?
      value
    end
  end
end
