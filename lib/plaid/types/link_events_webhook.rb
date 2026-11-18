# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # This webhook contains a summary of the events from a Link session and will be fired after the user finishes going
    # through Link. If the user abandons the Link flow (i.e., closes the hosted link webpage or leaves Link open for too
    # long without taking any action), the webhook will be fired 15-25 minutes after the last user interaction. A single
    # Link session may occasionally generate multiple `EVENTS` webhooks. If this occurs, the new webhook will contain
    # all previous events for the session, as well as new events that occurred since the previous `EVENTS` webhook was
    # sent. If this occurs, events can be grouped using the `link_session_id` field and, if necessary, de-duplicated
    # using the `event_id` field.
    #
    # By default, the `EVENTS` webhook is sent only for sessions where the end user goes through a Hosted Link flow
    # (including Link Recovery flows). If you would like to receive this webhook for sessions not using Hosted Link,
    # contact your account manager or support. This enablement will also cause you to receive the `SESSION_FINISHED`
    # webhook for non-Hosted-Link sessions and to be able to use `/link/token/get` to receive events data for non-Hosted
    # Link sessions.
    class LinkEventsWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :events, -> { Internal::Types::Array[Plaid::Types::LinkEvent] }, optional: false, nullable: false

      field :link_session_id, -> { String }, optional: false, nullable: false

      field :link_token, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
