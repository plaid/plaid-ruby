# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # InstitutionsGetByIdResponse defines the response schema for `/institutions/get_by_id`
    class InstitutionsGetByIDResponse < Internal::Types::Model
      field :institution, -> { Plaid::Types::Institution }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
