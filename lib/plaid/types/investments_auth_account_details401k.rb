# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Additional account fee and contribution information for 401k type accounts.
    class InvestmentsAuthAccountDetails401K < Internal::Types::Model
      field :account_id, -> { String }, optional: true, nullable: false

      field :fee_details, -> { Plaid::Types::InvestmentsAuth401KFeeDetails }, optional: true, nullable: false

      field :contribution_details, -> { Plaid::Types::InvestmentsAuth401KContributionDetails }, optional: true, nullable: false
    end
  end
end
