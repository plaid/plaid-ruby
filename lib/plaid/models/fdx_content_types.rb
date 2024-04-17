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
  class FDXContentTypes
    APPLICATION_PDF = "application/pdf".freeze
    IMAGE_GIF = "image/gif".freeze
    IMAGE_JPEG = "image/jpeg".freeze
    IMAGE_TIFF = "image/tiff".freeze
    IMAGE_PNG = "image/png".freeze
    APPLICATION_JSON = "application/json".freeze

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
