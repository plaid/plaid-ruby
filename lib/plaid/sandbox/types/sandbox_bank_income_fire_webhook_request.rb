# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxBankIncomeFireWebhookRequest < Internal::Types::Model
        field :webhook_override, -> { String }, optional: true, nullable: false

        field :webhook_code, -> { Plaid::Types::SandboxBankIncomeWebhookFireRequestWebhookCode }, optional: false, nullable: false

        field :webhook_fields, -> { Plaid::Types::SandboxBankIncomeWebhookFireRequestWebhookFields }, optional: false, nullable: false
      end
    end
  end
end
