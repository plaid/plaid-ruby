# frozen_string_literal: true

module Plaid
  module Item
    module Types
      class ItemActivityListRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: true, nullable: false

        field :cursor, -> { String }, optional: true, nullable: false

        field :count, -> { Integer }, optional: true, nullable: false
      end
    end
  end
end
