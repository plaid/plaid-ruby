# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired after an asynchronous extraction on an investment account.
    class InvestmentsHistoricalUpdateWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true

      field :new_investments_transactions, -> { Float }, optional: false, nullable: false

      field :cancelled_investments_transactions, -> { Float }, optional: false, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
