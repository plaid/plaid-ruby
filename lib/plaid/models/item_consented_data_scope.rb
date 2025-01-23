=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.610.1

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  class ItemConsentedDataScope
    ACCOUNT_AND_BALANCE_INFO = "account_and_balance_info".freeze
    CONTACT_INFO = "contact_info".freeze
    ACCOUNT_AND_ROUTING_NUMBERS = "account_and_routing_numbers".freeze
    TRANSACTIONS = "transactions".freeze
    CREDIT_AND_LOANS = "credit_and_loans".freeze
    INVESTMENTS = "investments".freeze
    BANK_STATEMENTS = "bank_statements".freeze
    RISK_INFO = "risk_info".freeze

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
