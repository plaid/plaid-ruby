# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when Plaid is unable to originate a new ACH transaction of the recurring transfer on the planned date.
    class RecurringTransferSkippedWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :recurring_transfer_id, -> { String }, optional: false, nullable: false

      field :authorization_decision, -> { Plaid::Types::TransferAuthorizationDecision }, optional: false, nullable: false

      field :authorization_decision_rationale_code, -> { Plaid::Types::TransferAuthorizationDecisionRationaleCode }, optional: true, nullable: false

      field :skipped_origination_date, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
