# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An APR that applies to a line of credit.
    class LiabilityOverrideApr < Internal::Types::Model
      field :apr_type, -> { Plaid::Types::LiabilityOverrideAprType }, optional: false, nullable: false

      field :apr_percentage, -> { Float }, optional: true, nullable: false

      field :balance_subject_to_apr, -> { Float }, optional: true, nullable: false

      field :interest_charge_amount, -> { Float }, optional: true, nullable: false
    end
  end
end
