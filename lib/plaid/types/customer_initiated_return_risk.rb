# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The object contains a risk score and a risk tier that evaluate the transaction return risk of an unauthorized
    # debit. Common return codes in this category include: "R05", "R07", "R10", "R11", "R29". These returns typically
    # have a return time frame of up to 60 calendar days. During this period, customers of financial institutions can
    # dispute a transaction as unauthorized.
    class CustomerInitiatedReturnRisk < Internal::Types::Model
      field :score, -> { Integer }, optional: false, nullable: false

      field :risk_tier, -> { Integer }, optional: false, nullable: false
    end
  end
end
