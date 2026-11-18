# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies options for initializing Link for use with the Cashflow Insights product.
    class LinkTokenCreateRequestCraOptionsCashflowInsights < Internal::Types::Model
      field :attributes_version, -> { Plaid::Types::CashflowAttributesVersion }, optional: true, nullable: true
    end
  end
end
