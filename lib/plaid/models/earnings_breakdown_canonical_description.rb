=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.370.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.1.1

=end

require 'date'
require 'time'

module Plaid
  class EarningsBreakdownCanonicalDescription
    BONUS = "BONUS".freeze
    COMMISSION = "COMMISSION".freeze
    OVERTIME = "OVERTIME".freeze
    PAID_TIME_OFF = "PAID TIME OFF".freeze
    REGULAR_PAY = "REGULAR PAY".freeze
    VACATION = "VACATION".freeze
    BASIC_ALLOWANCE_HOUSING = "BASIC ALLOWANCE HOUSING".freeze
    BASIC_ALLOWANCE_SUBSISTENCE = "BASIC ALLOWANCE SUBSISTENCE".freeze
    OTHER = "OTHER".freeze
    NULL = "null".freeze

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
