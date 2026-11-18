# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # LiabilitiesGetResponse defines the response schema for `/liabilities/get`
    class LiabilitiesGetResponse < Internal::Types::Model
      field :accounts, -> { Internal::Types::Array[Plaid::Types::AccountBase] }, optional: false, nullable: false

      field :item, -> { Plaid::Types::Item }, optional: false, nullable: false

      field :liabilities, -> { Plaid::Types::LiabilitiesObject }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
