# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Account associated with the Item.
    class StatementsAccount < Internal::Types::Model
      field :account_id, -> { String }, optional: false, nullable: false

      field :account_mask, -> { String }, optional: false, nullable: false

      field :account_name, -> { String }, optional: false, nullable: false

      field :account_official_name, -> { String }, optional: false, nullable: false

      field :account_subtype, -> { String }, optional: false, nullable: false

      field :account_type, -> { String }, optional: false, nullable: false

      field :statements, -> { Internal::Types::Array[Plaid::Types::StatementsStatement] }, optional: false, nullable: false
    end
  end
end
