# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when there has been a new user event. The webhook payload contains limited information about the event.
    class ProtectUserEventWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :event_id, -> { String }, optional: false, nullable: false

      field :event_type, -> { String }, optional: false, nullable: false

      field :timestamp, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: false, nullable: true

      field :client_user_id, -> { String }, optional: true, nullable: true

      field :link_session_id, -> { String }, optional: true, nullable: true

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
