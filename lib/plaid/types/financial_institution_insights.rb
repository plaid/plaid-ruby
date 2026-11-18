# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Insights surrounding external financial institution counterparties associated with a user.
    class FinancialInstitutionInsights < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false

      field :entity_id, -> { String }, optional: true, nullable: true

      field :website, -> { String }, optional: false, nullable: true

      field :detected_accounts, -> { Internal::Types::Array[Plaid::Types::DetectedAccount] }, optional: false, nullable: false
    end
  end
end
