# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # IssuesSearchResponse defines the response schema for `/issues/search`.
    class IssuesSearchResponse < Internal::Types::Model
      field :issues, -> { Internal::Types::Array[Plaid::Types::Issue] }, optional: true, nullable: false

      field :request_id, -> { String }, optional: true, nullable: false
    end
  end
end
