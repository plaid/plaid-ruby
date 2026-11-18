# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Optional parameters to `/accounts/balance/get`.
    class AccountsBalanceGetRequestOptions < Internal::Types::Model
      field :account_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :min_last_updated_datetime, -> { String }, optional: true, nullable: false
    end
  end
end
