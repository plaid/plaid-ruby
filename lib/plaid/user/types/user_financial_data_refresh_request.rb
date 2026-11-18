# frozen_string_literal: true

module Plaid
  module User
    module Types
      class UserFinancialDataRefreshRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
