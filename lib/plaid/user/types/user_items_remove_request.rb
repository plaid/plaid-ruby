# frozen_string_literal: true

module Plaid
  module User
    module Types
      class UserItemsRemoveRequest < Internal::Types::Model
        field :user_token, -> { String }, optional: true, nullable: false

        field :user_id, -> { String }, optional: true, nullable: false

        field :item_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      end
    end
  end
end
