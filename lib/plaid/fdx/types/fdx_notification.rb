# frozen_string_literal: true

module Plaid
  module Fdx
    module Types
      class FdxNotification < Internal::Types::Model
        field :notification_id, -> { String }, optional: false, nullable: false, api_name: "notificationId"

        field :type, -> { Plaid::Types::FdxNotificationType }, optional: false, nullable: false

        field :subtype, -> { String }, optional: true, nullable: false

        field :sent_on, -> { String }, optional: false, nullable: false, api_name: "sentOn"

        field :category, -> { Plaid::Types::FdxNotificationCategory }, optional: false, nullable: false

        field :severity, -> { Plaid::Types::FdxNotificationSeverity }, optional: true, nullable: false

        field :priority, -> { Plaid::Types::FdxNotificationPriority }, optional: true, nullable: false

        field :publisher, -> { Plaid::Types::FdxParty }, optional: true, nullable: false

        field :subscriber, -> { Plaid::Types::FdxParty }, optional: true, nullable: false

        field :notification_payload, -> { Plaid::Types::FdxNotificationPayload }, optional: false, nullable: false, api_name: "notificationPayload"

        field :url, -> { Plaid::Types::FdxHateoasLink }, optional: true, nullable: false
      end
    end
  end
end
