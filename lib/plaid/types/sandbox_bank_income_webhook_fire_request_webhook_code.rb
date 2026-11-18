# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module SandboxBankIncomeWebhookFireRequestWebhookCode
      extend Plaid::Internal::Types::Enum

      BANK_INCOME_REFRESH_UPDATE = "BANK_INCOME_REFRESH_UPDATE"
      BANK_INCOME_REFRESH_COMPLETE = "BANK_INCOME_REFRESH_COMPLETE"
    end
  end
end
