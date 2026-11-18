# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SandboxBankIncomeFireWebhookResponse defines the response schema for `/sandbox/bank_income/fire_webhook`
    class SandboxBankIncomeFireWebhookResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
