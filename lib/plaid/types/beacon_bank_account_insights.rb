# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Bank Account Insights encapsulate the risk insights for a single Bank Account linked to an Item that is associated
    # with a Beacon User.
    class BeaconBankAccountInsights < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :type, -> { Plaid::Types::AccountType }, optional: false, nullable: false

      field :subtype, -> { Plaid::Types::AccountSubtype }, optional: false, nullable: true

      field :attributes, -> { Plaid::Types::BeaconAccountRiskAttributes }, optional: false, nullable: false
    end
  end
end
