# frozen_string_literal: true

module Plaid
  module User
    module Types
      class UserTransactionsRefreshRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
