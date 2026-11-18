# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The name of the employer, as reported on the paystub.
    class EmployerIncomeSummaryFieldString < Internal::Types::Model
      field :value, -> { String }, optional: false, nullable: false

      field :verification_status, -> { Plaid::Types::VerificationStatus }, optional: false, nullable: false
    end
  end
end
