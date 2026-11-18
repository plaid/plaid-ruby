# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxTransferFireWebhookRequest < Internal::Types::Model
        field :webhook, -> { String }, optional: false, nullable: false
      end
    end
  end
end
