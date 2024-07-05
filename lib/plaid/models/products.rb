=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.534.3

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  class Products
    ASSETS = "assets".freeze
    AUTH = "auth".freeze
    BALANCE = "balance".freeze
    BALANCE_PLUS = "balance_plus".freeze
    BEACON = "beacon".freeze
    IDENTITY = "identity".freeze
    IDENTITY_MATCH = "identity_match".freeze
    INVESTMENTS = "investments".freeze
    INVESTMENTS_AUTH = "investments_auth".freeze
    LIABILITIES = "liabilities".freeze
    PAYMENT_INITIATION = "payment_initiation".freeze
    IDENTITY_VERIFICATION = "identity_verification".freeze
    TRANSACTIONS = "transactions".freeze
    CREDIT_DETAILS = "credit_details".freeze
    INCOME = "income".freeze
    INCOME_VERIFICATION = "income_verification".freeze
    DEPOSIT_SWITCH = "deposit_switch".freeze
    STANDING_ORDERS = "standing_orders".freeze
    TRANSFER = "transfer".freeze
    EMPLOYMENT = "employment".freeze
    RECURRING_TRANSACTIONS = "recurring_transactions".freeze
    SIGNAL = "signal".freeze
    STATEMENTS = "statements".freeze
    PROCESSOR_PAYMENTS = "processor_payments".freeze
    PROCESSOR_IDENTITY = "processor_identity".freeze
    PROFILE = "profile".freeze
    CRA_BASE_REPORT = "cra_base_report".freeze
    CRA_INCOME_INSIGHTS = "cra_income_insights".freeze
    CRA_PARTNER_INSIGHTS = "cra_partner_insights".freeze
    LAYER = "layer".freeze

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
      # We do not validate that the value is one of the enums set in the OpenAPI
      # file because we want to be able to add to our list of enums without
      # breaking this client library.
      value
    end
  end

end
