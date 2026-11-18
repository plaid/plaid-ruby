# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # InstitutionsGetResponse defines the response schema for `/institutions/get`
    class InstitutionsGetResponse < Internal::Types::Model
      field :institutions, -> { Internal::Types::Array[Plaid::Types::Institution] }, optional: false, nullable: false

      field :total, -> { Integer }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
