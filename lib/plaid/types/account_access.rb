# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Allow or disallow product access by account. Unlisted (e.g. missing) accounts will be considered `new_accounts`.
    class AccountAccess < Internal::Types::Model
      field :unique_id, -> { String }, optional: false, nullable: false

      field :authorized, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :account_product_access, -> { Plaid::Types::AccountProductAccessNullable }, optional: true, nullable: true
    end
  end
end
