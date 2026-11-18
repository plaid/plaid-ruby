# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PaymentInitiationConsentProcessingMode
      extend Plaid::Internal::Types::Enum

      ASYNC = "ASYNC"
      IMMEDIATE = "IMMEDIATE"
    end
  end
end
