# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when the status of an income verification instance has changed. This webhook is fired for both the Document
    # and Payroll Income flows, but not the Bank Income flow. It will typically take several minutes for this webhook to
    # fire after the end user has uploaded their documents in the Document Income flow.
    class IncomeVerificationStatusWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :verification_status, -> { String }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
