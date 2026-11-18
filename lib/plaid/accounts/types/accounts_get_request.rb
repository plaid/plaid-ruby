# frozen_string_literal: true

module Plaid
  module Accounts
    module Types
      class AccountsGetRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :options, -> { Plaid::Types::AccountsGetRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
