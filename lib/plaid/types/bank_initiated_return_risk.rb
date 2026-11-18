# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The object contains a risk score and a risk tier that evaluate the transaction return risk because an account is
    # overdrawn or because an ineligible account is used. Common return codes in this category include: "R01", "R02",
    # "R03", "R04", "R06", "R08", "R09", "R13", "R16", "R17", "R20", "R23". These returns have a turnaround time of 2
    # banking days.
    class BankInitiatedReturnRisk < Internal::Types::Model
      field :score, -> { Integer }, optional: false, nullable: false

      field :risk_tier, -> { Integer }, optional: false, nullable: false
    end
  end
end
