# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines an expected sweep date and amount.
    class TransferExpectedSweepSettlementScheduleItem < Internal::Types::Model
      field :sweep_settlement_date, -> { String }, optional: false, nullable: false

      field :swept_settled_amount, -> { String }, optional: false, nullable: false
    end
  end
end
