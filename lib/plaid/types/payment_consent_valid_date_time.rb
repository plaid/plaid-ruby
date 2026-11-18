# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Life span for the payment consent. After the `to` date the payment consent expires and can no longer be used for
    # payment initiation.
    class PaymentConsentValidDateTime < Internal::Types::Model
      field :from, -> { String }, optional: true, nullable: true

      field :to, -> { String }, optional: true, nullable: true
    end
  end
end
