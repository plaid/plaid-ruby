# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about the Taxpayer identification values assigned to the individual or legal entity.
    class TaxpayerIdentifier < Internal::Types::Model
      field :taxpayer_identifier_type, -> { Plaid::Types::TaxpayerIdentifierType }, optional: false, nullable: true, api_name: "TaxpayerIdentifierType"

      field :taxpayer_identifier_value, -> { String }, optional: false, nullable: true, api_name: "TaxpayerIdentifierValue"
    end
  end
end
