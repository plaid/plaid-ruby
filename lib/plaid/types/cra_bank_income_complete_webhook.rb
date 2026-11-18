# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Fired when a bank income report has finished generating or failed to generate, triggered by calling
    # `/credit/bank_income/get`.
    class CraBankIncomeCompleteWebhook < Internal::Types::Model
      field :webhook_type, -> { String }, optional: false, nullable: false

      field :webhook_code, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: false, nullable: false

      field :result, -> { Plaid::Types::CraBankIncomeCompleteResult }, optional: true, nullable: false

      field :environment, -> { Plaid::Types::WebhookEnvironmentValues }, optional: false, nullable: false
    end
  end
end
