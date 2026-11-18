# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxIncomeFireWebhookRequest < Internal::Types::Model
        field :item_id, -> { String }, optional: false, nullable: false

        field :user_id, -> { String }, optional: true, nullable: false

        field :webhook, -> { String }, optional: false, nullable: false

        field :verification_status, -> { Plaid::Sandbox::Types::SandboxIncomeFireWebhookRequestVerificationStatus }, optional: true, nullable: false

        field :webhook_code, -> { Plaid::Types::SandboxIncomeWebhookFireRequestWebhookCode }, optional: false, nullable: false
      end
    end
  end
end
