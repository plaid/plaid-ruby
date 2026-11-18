# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProcessorTokenPermissionsGetResponse defines the response schema for `/processor/token/permissions/get`
    class ProcessorTokenPermissionsGetResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: false, nullable: false
    end
  end
end
