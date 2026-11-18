# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # This webhook is only sent to [Plaid processor partners](https://plaid.com/docs/auth/partnerships/).
    #
    # Fired when a processor updates the webhook URL for a processor token via `/processor/token/webhook/update`.
    class ProcessorTokenWebhookUpdate < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true

      field :account_id, -> { String }, optional: false, nullable: false

      field :new_webhook_url, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
