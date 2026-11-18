# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PaymentInitiationConsentScope
      extend Plaid::Internal::Types::Enum

      ME_TO_ME = "ME_TO_ME"
      EXTERNAL = "EXTERNAL"
    end
  end
end
