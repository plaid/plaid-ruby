# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when a subscribed Consumer Report has been updated. Retrieve the updated products by calling the relevant
    # product `/get` endpoint. A single webhook covers all Consumer Report update subscriptions; the
    # `successful_products`/`failed_products` fields indicate which products were updated, and the `scope` field
    # indicates the data the report was computed over.
    class CraReportUpdatedWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: false, nullable: false

      field :client_user_id, -> { String }, optional: false, nullable: false

      field :report_id, -> { String }, optional: true, nullable: true

      field :scope, -> { Plaid::Types::CraReportScope }, optional: false, nullable: false

      field :successful_products, -> { Internal::Types::Array[Plaid::Types::CreditProduct] }, optional: false, nullable: false

      field :failed_products, -> { Internal::Types::Array[Plaid::Types::CreditProduct] }, optional: false, nullable: false

      field :generated_time, -> { String }, optional: true, nullable: true

      field :error_code, -> { String }, optional: true, nullable: true

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
