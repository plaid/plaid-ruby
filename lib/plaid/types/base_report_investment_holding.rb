# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A securities holding at an institution.
    class BaseReportInvestmentHolding < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :security_id, -> { String }, optional: false, nullable: false

      field :institution_price, -> { Float }, optional: false, nullable: false

      field :institution_price_as_of, -> { String }, optional: true, nullable: true

      field :institution_value, -> { Float }, optional: false, nullable: false

      field :cost_basis, -> { Float }, optional: false, nullable: true

      field :quantity, -> { Float }, optional: false, nullable: false

      field :iso_currency_code, -> { String }, optional: false, nullable: true

      field :unofficial_currency_code, -> { String }, optional: false, nullable: true

      field :tax_lots, -> { Internal::Types::Array[Plaid::Types::HoldingTaxLot] }, optional: true, nullable: false
    end
  end
end
