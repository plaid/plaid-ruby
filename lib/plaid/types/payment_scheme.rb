# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PaymentScheme
      extend Plaid::Internal::Types::Enum

      LOCAL_DEFAULT = "LOCAL_DEFAULT"
      LOCAL_INSTANT = "LOCAL_INSTANT"
      SEPA_CREDIT_TRANSFER = "SEPA_CREDIT_TRANSFER"
      SEPA_CREDIT_TRANSFER_INSTANT = "SEPA_CREDIT_TRANSFER_INSTANT"
    end
  end
end
