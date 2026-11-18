# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The employee's estimated annual salary, as derived from information reported on the paystub.
    class ProjectedIncomeSummaryFieldNumber < Internal::Types::Model
      field :value, -> { Float }, optional: false, nullable: false

      field :verification_status, -> { Plaid::Types::VerificationStatus }, optional: false, nullable: false
    end
  end
end
