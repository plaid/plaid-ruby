# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxUserFireWebhookRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: true, nullable: false

        field :user_token, -> { String }, optional: true, nullable: false

        field :webhook_type, -> { Plaid::Types::SandboxUserFireWebhookType }, optional: false, nullable: false

        field :webhook_code, -> { Plaid::Types::SandboxUserFireWebhookCode }, optional: false, nullable: false

        field :webhook, -> { String }, optional: false, nullable: false
      end
    end
  end
end
