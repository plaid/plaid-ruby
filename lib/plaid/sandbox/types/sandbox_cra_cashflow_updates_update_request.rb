# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxCraCashflowUpdatesUpdateRequest < Internal::Types::Model
        field :user_token, -> { String }, optional: true, nullable: false

        field :webhook_codes, -> { Internal::Types::Array[Plaid::Types::CashFlowUpdatesEventWebhookCodes] }, optional: true, nullable: true

        field :user_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
