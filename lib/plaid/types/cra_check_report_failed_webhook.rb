# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when a Check Report has failed to generate. To get more details, call `/user/items/get` and check for
    # non-null `error` objects on the associated Items in the response. These `error` objects will contain more details
    # on why the Item is in an error state and how to resolve it. After resolving the errors, you can try to re-generate
    # the report.
    class CraCheckReportFailedWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: false, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: false, nullable: true

      field :repairable_items, -> { Internal::Types::Array[Plaid::Types::CheckReportRepairableItem] }, optional: false, nullable: false

      field :failed_products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: false, nullable: false

      field :item_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
