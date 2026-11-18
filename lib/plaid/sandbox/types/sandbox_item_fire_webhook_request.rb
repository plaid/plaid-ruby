# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxItemFireWebhookRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :webhook_type, -> { Plaid::Types::WebhookType }, optional: true, nullable: false

        field :webhook_code, -> { Plaid::Sandbox::Types::SandboxItemFireWebhookRequestWebhookCode }, optional: false, nullable: false

        field :options, -> { Plaid::Types::SandboxItemFireWebhookRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
