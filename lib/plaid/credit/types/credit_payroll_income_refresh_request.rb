# frozen_string_literal: true

module Plaid
  module Credit
    module Types
      class CreditPayrollIncomeRefreshRequest < Internal::Types::Model
        field :user_token, -> { String }, optional: true, nullable: false

        field :user_id, -> { String }, optional: true, nullable: false

        field :options, -> { Plaid::Types::CreditPayrollIncomeRefreshRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
