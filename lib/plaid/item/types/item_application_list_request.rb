# frozen_string_literal: true

module Plaid
  module Item
    module Types
      class ItemApplicationListRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: true, nullable: true
      end
    end
  end
end
