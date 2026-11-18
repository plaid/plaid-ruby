# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Year-to-date pre-tax earnings, as reported on the paystub.
    class YtdGrossIncomeSummaryFieldNumber < Internal::Types::Model
      field :value, -> { Float }, optional: false, nullable: false

      field :verification_status, -> { Plaid::Types::VerificationStatus }, optional: false, nullable: false
    end
  end
end
