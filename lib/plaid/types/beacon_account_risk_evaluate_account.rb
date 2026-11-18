# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An account in the `/beacon/account_risk/v1/evaluate` response.
    class BeaconAccountRiskEvaluateAccount < Internal::Types::Model
      field :account_id, -> { String }, optional: true, nullable: false

      field :type, -> { Plaid::Types::AccountType }, optional: true, nullable: false

      field :subtype, -> { Plaid::Types::AccountSubtype }, optional: true, nullable: true

      field :attributes, -> { Plaid::Types::BeaconAccountRiskEvaluateAccountAttributes }, optional: true, nullable: false
    end
  end
end
