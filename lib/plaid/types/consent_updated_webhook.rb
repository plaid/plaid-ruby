# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when the user changes the consent duration at their institution, and the change updates the Item's
    # `consent_expiration_time`. The payload carries the new `consent_expiration_time` value. The
    # `consent_expiration_time` can still be sourced from `/item/get`. `PENDING_DISCONNECT` will still be fired 7 days
    # before the Item is scheduled to disconnect. This webhook is in beta. Currently, it is fired only for Chase items.
    class ConsentUpdatedWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :consent_expiration_time, -> { String }, optional: false, nullable: true

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
