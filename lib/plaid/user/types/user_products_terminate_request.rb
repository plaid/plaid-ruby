# frozen_string_literal: true

module Plaid
  module User
    module Types
      class UserProductsTerminateRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: false, nullable: false

        field :reason_code, -> { Plaid::Types::ProductsTerminateReasonCode }, optional: false, nullable: false

        field :reason_note, -> { String }, optional: true, nullable: true
      end
    end
  end
end
