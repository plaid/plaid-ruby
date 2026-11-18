# frozen_string_literal: true

module Plaid
  module Signal
    module Types
      class SignalDecisionReportRequest < Internal::Types::Model
        field :client_transaction_id, -> { String }, optional: false, nullable: false

        field :initiated, -> { Internal::Types::Boolean }, optional: false, nullable: false

        field :days_funds_on_hold, -> { Integer }, optional: true, nullable: true

        field :decision_outcome, -> { Plaid::Types::SignalDecisionOutcome }, optional: true, nullable: true

        field :payment_method, -> { Plaid::Types::SignalPaymentMethod }, optional: true, nullable: true

        field :amount_instantly_available, -> { Float }, optional: true, nullable: true

        field :submitted_at, -> { String }, optional: true, nullable: false
      end
    end
  end
end
