# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Configuration parameters for the Investments Move product. Masked Number Match and Stated Account Number default
    # to `true` when omitted. Manual Entry defaults to `false`.
    class LinkTokenInvestmentsAuth < Internal::Types::Model
      field :manual_entry_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :masked_number_match_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :stated_account_number_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :rollover401k_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: true, api_name: "rollover_401k_enabled"
    end
  end
end
