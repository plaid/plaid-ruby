# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # StatementsListResponse defines the response schema for `/statements/list`
    class StatementsListResponse < Internal::Types::Model
      field :accounts, -> { Internal::Types::Array[Plaid::Types::StatementsAccount] }, optional: false, nullable: false

      field :institution_id, -> { String }, optional: false, nullable: false

      field :institution_name, -> { String }, optional: false, nullable: false

      field :item_id, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
