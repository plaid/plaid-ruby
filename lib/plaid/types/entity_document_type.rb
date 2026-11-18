# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module EntityDocumentType
      extend Plaid::Internal::Types::Enum

      BIK = "bik"
      BUSINESS_NUMBER = "business_number"
      IMO = "imo"
      OTHER = "other"
      SWIFT = "swift"
      TAX_ID = "tax_id"
    end
  end
end
