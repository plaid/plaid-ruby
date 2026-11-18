# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Information about the last successful and failed transactions update for the Item.
    class ItemStatusTransactions < Internal::Types::Model
      field :last_successful_update, -> { String }, optional: true, nullable: true

      field :last_failed_update, -> { String }, optional: true, nullable: true
    end
  end
end
