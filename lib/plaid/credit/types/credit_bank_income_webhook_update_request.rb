# frozen_string_literal: true

module Plaid
  module Credit
    module Types
      class CreditBankIncomeWebhookUpdateRequest < Internal::Types::Model
        field :user_token, -> { String }, optional: false, nullable: false

        field :user_id, -> { String }, optional: true, nullable: false

        field :enable_webhooks, -> { Internal::Types::Boolean }, optional: false, nullable: false
      end
    end
  end
end
