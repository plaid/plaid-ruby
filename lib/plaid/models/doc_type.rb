=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.508.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

require 'date'
require 'time'

module Plaid
  class DocType
    UNKNOWN = "UNKNOWN".freeze
    DOCUMENT_TYPE_PAYSTUB = "DOCUMENT_TYPE_PAYSTUB".freeze
    DOCUMENT_TYPE_BANK_STATEMENT = "DOCUMENT_TYPE_BANK_STATEMENT".freeze
    DOCUMENT_TYPE_US_TAX_W2 = "DOCUMENT_TYPE_US_TAX_W2".freeze
    DOCUMENT_TYPE_US_MILITARY_ERAS = "DOCUMENT_TYPE_US_MILITARY_ERAS".freeze
    DOCUMENT_TYPE_US_MILITARY_LES = "DOCUMENT_TYPE_US_MILITARY_LES".freeze
    DOCUMENT_TYPE_US_MILITARY_CLES = "DOCUMENT_TYPE_US_MILITARY_CLES".freeze
    DOCUMENT_TYPE_GIG = "DOCUMENT_TYPE_GIG".freeze
    DOCUMENT_TYPE_NONE = "DOCUMENT_TYPE_NONE".freeze
    DOCUMENT_TYPE_US_TAX_1099_MISC = "DOCUMENT_TYPE_US_TAX_1099_MISC".freeze
    DOCUMENT_TYPE_US_TAX_1099_K = "DOCUMENT_TYPE_US_TAX_1099_K".freeze
    DOCUMENT_TYPE_PLAID_GENERATED_PAYSTUB_PDF = "DOCUMENT_TYPE_PLAID_GENERATED_PAYSTUB_PDF".freeze

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
