# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The collection of `TAXPAYER_IDENTIFICATION` elements
    class TaxpayerIdentifiers < Internal::Types::Model
      field :taxpayer_identifier, -> { Plaid::Types::TaxpayerIdentifier }, optional: false, nullable: false, api_name: "TAXPAYER_IDENTIFIER"
    end
  end
end
