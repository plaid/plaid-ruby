# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module WebhookEnvironmentValues
      extend Plaid::Internal::Types::Enum

      SANDBOX = "sandbox"
      PRODUCTION = "production"
    end
  end
end
