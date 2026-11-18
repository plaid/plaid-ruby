# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # For each user's Item enabled for Cash Flow Updates, this webhook will fire between one and four times a day with
    # information on the status of the update. This webhook will not fire immediately upon enrollment in Cash Flow
    # Updates. Upon receiving the webhook, call `/cra/monitoring_insights/get` to retrieve the updated insights. At
    # approximately the same time as the `INSIGHTS_UPDATED` webhook, any event-driven `CASH_FLOW_UPDATES` webhooks (e.g.
    # `LOW_BALANCE_DETECTED`, `LARGE_DEPOSIT_DETECTED`) that were triggered by the update will also fire. This webhook
    # has been replaced by the `CASH_FLOW_INSIGHTS_UPDATED` webhook for all customers who began using Plaid Check on or
    # after December 10, 2025.
    class CashFlowUpdatesInsightsWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :status, -> { Plaid::Types::MonitoringInsightsStatus }, optional: false, nullable: false

      field :user_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
