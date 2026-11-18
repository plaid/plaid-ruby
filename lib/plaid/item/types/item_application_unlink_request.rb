# frozen_string_literal: true

module Plaid
  module Item
    module Types
      class ItemApplicationUnlinkRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :application_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
