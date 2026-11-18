# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PaymentInitiationConsentType
      extend Plaid::Internal::Types::Enum

      SWEEPING = "SWEEPING"
      COMMERCIAL = "COMMERCIAL"
    end
  end
end
