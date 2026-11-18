# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains the status and date of an update to the loan.
    class CraLoanStatusHistoryUpdate < Internal::Types::Model
      field :status, -> { Plaid::Types::CraLoanStatus }, optional: false, nullable: false

      field :date, -> { String }, optional: false, nullable: false
    end
  end
end
