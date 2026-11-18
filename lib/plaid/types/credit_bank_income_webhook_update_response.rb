# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CreditBankIncomeWebhookUpdateResponse defines the response schema for `/credit/bank_income/webhook/update`.
    class CreditBankIncomeWebhookUpdateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
