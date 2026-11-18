# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CountryCode
      extend Plaid::Internal::Types::Enum

      US = "US"
      GB = "GB"
      ES = "ES"
      NL = "NL"
      FR = "FR"
      IE = "IE"
      CA = "CA"
      DE = "DE"
      IT = "IT"
      PL = "PL"
      DK = "DK"
      NO = "NO"
      SE = "SE"
      EE = "EE"
      LT = "LT"
      LV = "LV"
      PT = "PT"
      BE = "BE"
      AT = "AT"
      FI = "FI"
    end
  end
end
