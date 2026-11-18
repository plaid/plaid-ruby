# frozen_string_literal: true

module Plaid
  module Credit
    module Types
      class CreditBankIncomeRefreshRequest < Internal::Types::Model
        field :user_token, -> { String }, optional: false, nullable: false

        field :user_id, -> { String }, optional: true, nullable: false

        field :options, -> { Plaid::Types::CreditBankIncomeRefreshRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
