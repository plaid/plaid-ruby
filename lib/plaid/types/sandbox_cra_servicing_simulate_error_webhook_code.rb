# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module SandboxCraServicingSimulateErrorWebhookCode
      extend Plaid::Internal::Types::Enum

      USER_NOT_FOUND = "USER_NOT_FOUND"
      PRODUCT_GENERATION_FAILED = "PRODUCT_GENERATION_FAILED"
      UNMATCH = "UNMATCH"
      DATA_UNAVAILABLE = "DATA_UNAVAILABLE"
      NO_ELIGIBLE_ITEMS_ON_PROFILE = "NO_ELIGIBLE_ITEMS_ON_PROFILE"
    end
  end
end
