# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Metadata about the Item.
    class Item < Internal::Types::Model
      field :item_id, -> { String }, optional: false, nullable: false

      field :institution_id, -> { String }, optional: true, nullable: true

      field :institution_name, -> { String }, optional: true, nullable: true

      field :webhook, -> { String }, optional: false, nullable: true

      field :auth_method, -> { Plaid::Types::ItemAuthMethod }, optional: true, nullable: true

      field :error, -> { Plaid::Types::PlaidError }, optional: false, nullable: true

      field :available_products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: false, nullable: false

      field :billed_products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: false, nullable: false

      field :products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: false, nullable: false

      field :consented_products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: true, nullable: false

      field :consent_expiration_time, -> { String }, optional: false, nullable: true

      field :update_type, -> { Plaid::Types::ItemUpdateType }, optional: false, nullable: false

      field :paired_item_id, -> { String }, optional: true, nullable: true
    end
  end
end
