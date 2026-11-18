# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module WalletPaymentScheme
      extend Plaid::Internal::Types::Enum

      FASTER_PAYMENTS = "FASTER_PAYMENTS"
      SEPA_CREDIT_TRANSFER = "SEPA_CREDIT_TRANSFER"
      SEPA_CREDIT_TRANSFER_INSTANT = "SEPA_CREDIT_TRANSFER_INSTANT"
    end
  end
end
