# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Object containing information on contribution transactions for the 401k account. Note that the sum fields in this
    # object represent the total of absolute contribution values.
    class InvestmentsAuth401KContributionDetails < Internal::Types::Model
      field :last_contribution_transactions, -> { Internal::Types::Array[Plaid::Types::InvestmentTransaction] }, optional: false, nullable: false

      field :contribution_count1m, -> { Integer }, optional: false, nullable: false, api_name: "contribution_count_1m"

      field :contribution_amount1m, -> { Float }, optional: false, nullable: false, api_name: "contribution_amount_1m"

      field :contribution_count6m, -> { Integer }, optional: false, nullable: false, api_name: "contribution_count_6m"

      field :contribution_amount6m, -> { Float }, optional: false, nullable: false, api_name: "contribution_amount_6m"

      field :contribution_count12m, -> { Integer }, optional: false, nullable: false, api_name: "contribution_count_12m"

      field :contribution_amount12m, -> { Float }, optional: false, nullable: false, api_name: "contribution_amount_12m"
    end
  end
end
