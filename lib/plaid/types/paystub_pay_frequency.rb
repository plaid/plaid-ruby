# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PaystubPayFrequency
      extend Plaid::Internal::Types::Enum

      MONTHLY = "MONTHLY"
      BI_WEEKLY = "BI-WEEKLY"
      WEEKLY = "WEEKLY"
      SEMI_MONTHLY = "SEMI-MONTHLY"
    end
  end
end
