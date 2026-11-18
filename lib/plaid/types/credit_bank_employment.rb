# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Detailed information for the bank employment.
    class CreditBankEmployment < Internal::Types::Model
      field :bank_employment_id, -> { String }, optional: false, nullable: false

      field :account_id, -> { String }, optional: false, nullable: false

      field :employer, -> { Plaid::Types::CreditBankEmployer }, optional: false, nullable: false

      field :latest_deposit_date, -> { String }, optional: false, nullable: false

      field :earliest_deposit_date, -> { String }, optional: false, nullable: false
    end
  end
end
