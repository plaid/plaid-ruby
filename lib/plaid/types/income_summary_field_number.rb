# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Field number for income summary
    class IncomeSummaryFieldNumber < Internal::Types::Model
      field :value, -> { Float }, optional: false, nullable: false

      field :verification_status, -> { Plaid::Types::VerificationStatus }, optional: false, nullable: false
    end
  end
end
