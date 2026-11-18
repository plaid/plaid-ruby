# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains the state of a completed Link session, along with the public token(s) if available.
    #
    # By default, this webhook is sent only for sessions enabled for the Hosted Link flow (including Link Recovery
    # flows), a Multi-Item Link flow, or a Layer flow. If you would like to receive this webhook for other sessions,
    # contact your account manager or support. This enablement will also enable the `EVENTS` webhook for all Link
    # sessions and the ability to use `/link/token/get` to retrieve events for non-Hosted-Link sessions.
    class LinkSessionFinishedWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :status, -> { String }, optional: false, nullable: false

      field :link_session_id, -> { String }, optional: false, nullable: false

      field :link_token, -> { String }, optional: false, nullable: false

      field :public_token, -> { String }, optional: true, nullable: false

      field :public_tokens, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
