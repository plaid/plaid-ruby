# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # For each user's Item enabled for Cash Flow Updates, this webhook will fire when an update detects a new loan
    # payment. Upon receiving the webhook, call `/cra/monitoring_insights/get` to retrieve the updated insights.
    class CashFlowUpdatesNewLoanPaymentWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :status, -> { Plaid::Types::MonitoringInsightsStatus }, optional: false, nullable: false

      field :user_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
