# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when a change to the user's income is detected. To obtain refreshed Bank Income data, send the user through
    # Link's update mode so they can confirm their income sources, or migrate to CRA Income Insights and call
    # `/cra/check_report/create` for a backend refresh. To receive this webhook, subscribe in the
    # [Dashboard](https://dashboard.plaid.com/developers/webhooks).
    class BankIncomeRefreshUpdateWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
