# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when a refreshed bank income report has finished generating or failed to generate. To obtain refreshed Bank
    # Income data, send the user through Link's update mode, or migrate to CRA Income Insights and call
    # `/cra/check_report/create` for a backend refresh. To get this webhook, subscribe via the
    # [Dashboard](https://dashboard.plaid.com/developers/webhooks).
    class BankIncomeRefreshCompleteWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: false, nullable: false

      field :result, -> { Plaid::Types::BankIncomeRefreshCompleteResult }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
