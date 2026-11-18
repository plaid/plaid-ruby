# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when the attempt to refresh Payroll Income data for a user via `/credit/payroll_income/refresh` failed
    # because the user must re-connect their payroll account.
    class IncomeVerificationRefreshReconnectNeededWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
