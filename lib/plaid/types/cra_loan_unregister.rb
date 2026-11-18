# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains loan data for the loan being unregistered.
    class CraLoanUnregister < Internal::Types::Model
      field :loan_id, -> { String }, optional: false, nullable: false

      field :closed_with_status, -> { Plaid::Types::CraLoanClosedStatus }, optional: false, nullable: false
    end
  end
end
