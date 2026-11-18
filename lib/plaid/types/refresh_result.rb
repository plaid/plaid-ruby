# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # RefreshResult represents the result status of a user refresh for a specific item.
    class RefreshResult < Internal::Types::Model
      field :item_id, -> { String }, optional: true, nullable: false

      field :product, -> { String }, optional: true, nullable: false

      field :error, -> { Plaid::Types::PlaidError }, optional: true, nullable: true
    end
  end
end
