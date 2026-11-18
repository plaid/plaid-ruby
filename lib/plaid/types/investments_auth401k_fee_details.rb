# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Object containing information on account fee transactions for the 401k account.
    class InvestmentsAuth401KFeeDetails < Internal::Types::Model
      field :account_fee_count12m, -> { Integer }, optional: false, nullable: false, api_name: "account_fee_count_12m"

      field :account_fee_amount12m, -> { Float }, optional: false, nullable: false, api_name: "account_fee_amount_12m"
    end
  end
end
