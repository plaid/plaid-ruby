# frozen_string_literal: true

module Plaid
  module Item
    module Types
      class ItemGetRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
