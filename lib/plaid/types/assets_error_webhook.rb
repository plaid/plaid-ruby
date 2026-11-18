# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when Asset Report generation has failed. The resulting `error` will have an `error_type` of
    # `ASSET_REPORT_ERROR`.
    class AssetsErrorWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: false, nullable: true

      field :asset_report_id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
