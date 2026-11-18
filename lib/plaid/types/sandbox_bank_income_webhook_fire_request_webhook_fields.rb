# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Optional fields which will be populated in the simulated webhook
    class SandboxBankIncomeWebhookFireRequestWebhookFields < Internal::Types::Model
      field :user_id, -> { String }, optional: false, nullable: false

      field :bank_income_refresh_complete_result, -> { Plaid::Types::BankIncomeRefreshCompleteResult }, optional: true, nullable: false
    end
  end
end
