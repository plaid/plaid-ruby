# frozen_string_literal: true

module Plaid
  module Item
    module Types
      class ItemPublicTokenExchangeRequest < Internal::Types::Model
        field :public_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
