# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when risk signals have been processed for documents uploaded via Document Income. It will typically take a
    # minute or two for this webhook to fire after the end user has uploaded their documents in the Document Income
    # flow. Once this webhook has fired, `/credit/payroll_income/risk_signals/get` may then be called to determine
    # whether the documents were successfully processed and to retrieve risk data.
    class IncomeVerificationRiskSignalsStatusWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :risk_signals_status, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
