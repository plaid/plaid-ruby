# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when an Item has exited the `ITEM_LOGIN_REQUIRED` state without the user having gone through the update mode
    # flow in your app (this can happen if the user completed the update mode in a different app). If you have messaging
    # that tells the user to complete the update mode flow, you should silence this messaging upon receiving the
    # `LOGIN_REPAIRED` webhook.
    class ItemLoginRepairedWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
