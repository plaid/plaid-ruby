# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about the APR on the account.
    class Apr < Internal::Types::Model
      field :apr_percentage, -> { Float }, optional: false, nullable: false

      field :apr_type, -> { Plaid::Types::AprAprType }, optional: false, nullable: false

      field :balance_subject_to_apr, -> { Float }, optional: false, nullable: true

      field :interest_charge_amount, -> { Float }, optional: false, nullable: true
    end
  end
end
