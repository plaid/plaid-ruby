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
  class BankTransferType
    DEBIT = "debit".freeze
    CREDIT = "credit".freeze

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
      constantValues = BankTransferType.constants.select { |c| BankTransferType::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #BankTransferType" if constantValues.empty?
      value
    end
  end
end
