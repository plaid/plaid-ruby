# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Optional parameters controlling the simulated report.
    class SandboxCraServicingSimulateRequestOptions < Internal::Types::Model
      field :transactions_end_date, -> { String }, optional: true, nullable: true

      field :error_webhook_code, -> { Plaid::Types::SandboxCraServicingSimulateErrorWebhookCode }, optional: true, nullable: true
    end
  end
end
