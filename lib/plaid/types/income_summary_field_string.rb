# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Data about the income summary
    class IncomeSummaryFieldString < Internal::Types::Model
      field :value, -> { String }, optional: false, nullable: false

      field :verification_status, -> { Plaid::Types::VerificationStatus }, optional: false, nullable: false
    end
  end
end
