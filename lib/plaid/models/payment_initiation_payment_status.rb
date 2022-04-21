=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.105.1

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.1.1

=end

require 'date'
require 'time'

module Plaid
  class PaymentInitiationPaymentStatus
    INPUT_NEEDED = "PAYMENT_STATUS_INPUT_NEEDED".freeze
    PROCESSING = "PAYMENT_STATUS_PROCESSING".freeze
    INITIATED = "PAYMENT_STATUS_INITIATED".freeze
    COMPLETED = "PAYMENT_STATUS_COMPLETED".freeze
    INSUFFICIENT_FUNDS = "PAYMENT_STATUS_INSUFFICIENT_FUNDS".freeze
    FAILED = "PAYMENT_STATUS_FAILED".freeze
    BLOCKED = "PAYMENT_STATUS_BLOCKED".freeze
    UNKNOWN = "PAYMENT_STATUS_UNKNOWN".freeze
    EXECUTED = "PAYMENT_STATUS_EXECUTED".freeze
    AUTHORISING = "PAYMENT_STATUS_AUTHORISING".freeze
    CANCELLED = "PAYMENT_STATUS_CANCELLED".freeze
    ESTABLISHED = "PAYMENT_STATUS_ESTABLISHED".freeze
    REJECTED = "PAYMENT_STATUS_REJECTED".freeze

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
