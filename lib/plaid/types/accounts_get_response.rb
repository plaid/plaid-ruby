# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # AccountsGetResponse defines the response schema for `/accounts/get` and `/accounts/balance/get`.
    class AccountsGetResponse < Internal::Types::Model
      field :accounts, -> { Internal::Types::Array[Plaid::Types::AccountBase] }, optional: false, nullable: false

      field :item, -> { Plaid::Types::Item }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
