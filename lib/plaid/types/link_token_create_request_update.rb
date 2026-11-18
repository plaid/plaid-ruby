# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies options for initializing Link for [update mode](https://plaid.com/docs/link/update-mode).
    class LinkTokenCreateRequestUpdate < Internal::Types::Model
      field :account_selection_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :reauthorization_enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :user, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :item_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true
    end
  end
end
