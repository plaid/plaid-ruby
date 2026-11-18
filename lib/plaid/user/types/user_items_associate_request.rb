# frozen_string_literal: true

module Plaid
  module User
    module Types
      class UserItemsAssociateRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: false, nullable: false

        field :item_ids, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      end
    end
  end
end
