# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module SandboxUserFireWebhookType
      extend Plaid::Internal::Types::Enum

      CHECK_REPORT = "CHECK_REPORT"
    end
  end
end
