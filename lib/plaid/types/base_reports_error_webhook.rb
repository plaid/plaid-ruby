# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when Base Report generation has failed. The resulting `error` will have an `error_type` of
    # `BASE_REPORT_ERROR`.
    class BaseReportsErrorWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: false, nullable: true

      field :user_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
