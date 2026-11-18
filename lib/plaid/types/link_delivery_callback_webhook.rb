# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Webhook containing metadata proxied over from Link callback e.g. `onEvent`, `onExit`, `onSuccess`.
    class LinkDeliveryCallbackWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :link_delivery_session_id, -> { String }, optional: false, nullable: false

      field :timestamp, -> { String }, optional: false, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true

      field :link_callback_metadata, -> { Plaid::Types::LinkCallbackMetadata }, optional: false, nullable: false
    end
  end
end
