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
  class LinkDeliveryVerificationStatus
    AUTOMATICALLY_VERIFIED = "automatically_verified".freeze
    PENDING_AUTOMATIC_VERIFICATION = "pending_automatic_verification".freeze
    PENDING_MANUAL_VERIFICATION = "pending_manual_verification".freeze
    MANUALLY_VERIFIED = "manually_verified".freeze
    VERIFICATION_EXPIRED = "verification_expired".freeze
    VERIFICATION_FAILED = "verification_failed".freeze
    DATABASE_MATCHED = "database_matched".freeze
    DATABASE_INSIGHTS_PENDING = "database_insights_pending".freeze

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
