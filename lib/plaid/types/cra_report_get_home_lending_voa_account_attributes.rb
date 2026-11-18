# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Attributes derived for an account. May be `null` if attributes were not available.
    class CraReportGetHomeLendingVoaAccountAttributes < Internal::Types::Model
      field :is_primary_account, -> { Internal::Types::Boolean }, optional: false, nullable: true

      field :primary_account_score, -> { Float }, optional: false, nullable: true
    end
  end
end
