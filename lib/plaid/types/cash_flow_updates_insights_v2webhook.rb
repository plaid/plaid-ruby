# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # For each item on an enabled user, this webhook will fire up to four times a day with status information. This
    # webhook will not fire immediately upon enrollment in Cash Flow Updates. The payload may contain an `insights`
    # array with insights that have been detected, if any (e.g. `LOW_BALANCE_DETECTED`, `LARGE_DEPOSIT_DETECTED`). Upon
    # receiving the webhook, call `/cra/monitoring_insights/get` to retrieve the updated insights.
    class CashFlowUpdatesInsightsV2Webhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :status, -> { Plaid::Types::MonitoringInsightsStatus }, optional: false, nullable: false

      field :user_id, -> { String }, optional: false, nullable: false

      field :insights, -> { Internal::Types::Array[Plaid::Types::CashFlowInsight] }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
