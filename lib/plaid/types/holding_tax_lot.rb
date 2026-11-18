# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A single acquisition lot within a holding.
    class HoldingTaxLot < Internal::Types::Model
      field :institution_lot_id, -> { String }, optional: false, nullable: true

      field :original_purchase_datetime, -> { String }, optional: false, nullable: true

      field :quantity, -> { Float }, optional: false, nullable: true

      field :purchase_price, -> { Float }, optional: false, nullable: true

      field :cost_basis, -> { Float }, optional: false, nullable: true

      field :current_value, -> { Float }, optional: false, nullable: true

      field :position_type, -> { Plaid::Types::HoldingTaxLotPositionType }, optional: false, nullable: true
    end
  end
end
