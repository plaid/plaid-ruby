# frozen_string_literal: true

module Plaid
  module Item
    module Types
      class ItemProductsTerminateRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :reason_code, -> { Plaid::Types::ProductsTerminateReasonCode }, optional: false, nullable: false

        field :reason_note, -> { String }, optional: true, nullable: true
      end
    end
  end
end
