=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.5.3

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.0

=end

require 'date'
require 'time'

module Plaid
  class ACHClass
    ARC = "arc".freeze
    CBR = "cbr".freeze
    CCD = "ccd".freeze
    CIE = "cie".freeze
    COR = "cor".freeze
    CTX = "ctx".freeze
    IAT = "iat".freeze
    MTE = "mte".freeze
    PBR = "pbr".freeze
    POP = "pop".freeze
    POS = "pos".freeze
    PPD = "ppd".freeze
    RCK = "rck".freeze
    TEL = "tel".freeze
    WEB = "web".freeze

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
      constantValues = ACHClass.constants.select { |c| ACHClass::const_get(c) == value }
      raise "Invalid ENUM value #{value} for class #ACHClass" if constantValues.empty?
      value
    end
  end
end
