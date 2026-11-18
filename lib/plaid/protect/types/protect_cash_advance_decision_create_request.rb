# frozen_string_literal: true

module Plaid
  module Protect
    module Types
      class ProtectCashAdvanceDecisionCreateRequest < Internal::Types::Model
        field :user, -> { Plaid::Types::ProtectUser }, optional: false, nullable: false

        field :client_advance_id, -> { String }, optional: true, nullable: true

        field :advance_type, -> { Plaid::Types::CashAdvanceType }, optional: true, nullable: false

        field :previous_advance_count, -> { Integer }, optional: true, nullable: true

        field :decision_time, -> { String }, optional: false, nullable: false

        field :decision, -> { Plaid::Types::CashAdvanceDecisionOutcome }, optional: false, nullable: false

        field :is_taken, -> { Internal::Types::Boolean }, optional: true, nullable: true

        field :cash_advance, -> { Plaid::Types::CashAdvanceInfo }, optional: true, nullable: true
      end
    end
  end
end
