# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SandboxIncomeFireWebhookResponse defines the response schema for `/sandbox/income/fire_webhook`
    class SandboxIncomeFireWebhookResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
