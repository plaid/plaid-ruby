# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when the Check Report is ready to be retrieved. The report expires 24 hours after it was created.
    class CraCheckReportReadyWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: false, nullable: false

      field :successful_products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: true, nullable: true

      field :failed_products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: true, nullable: true

      field :item_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
