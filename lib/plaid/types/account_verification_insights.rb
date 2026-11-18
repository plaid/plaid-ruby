# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Insights from performing database verification for the account. Only returned for Auth Items using Database Auth.
    class AccountVerificationInsights < Internal::Types::Model
      field :name_match_score, -> { Integer }, optional: true, nullable: true

      field :network_status, -> { Plaid::Types::AccountVerificationInsightsNetworkStatus }, optional: true, nullable: true

      field :previous_returns, -> { Plaid::Types::AccountVerificationInsightsPreviousReturns }, optional: true, nullable: true

      field :account_number_format, -> { Plaid::Types::AccountVerificationInsightsAccountNumberFormat }, optional: false, nullable: false
    end
  end
end
