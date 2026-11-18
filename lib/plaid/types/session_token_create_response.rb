# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SessionTokenCreateResponse defines the response schema for `/session/token/create`
    class SessionTokenCreateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :link, -> { Plaid::Types::SessionTokenCreateResponseLink }, optional: true, nullable: false
    end
  end
end
