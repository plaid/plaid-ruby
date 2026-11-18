# frozen_string_literal: true

module Plaid
  module Item
    module Types
      class ItemImportRequest < Internal::Types::Model
        field :institution_id, -> { String }, optional: true, nullable: false

        field :products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: true, nullable: false

        field :user_auth, -> { Plaid::Types::ItemImportRequestUserAuth }, optional: false, nullable: false

        field :options, -> { Plaid::Types::ItemImportRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
