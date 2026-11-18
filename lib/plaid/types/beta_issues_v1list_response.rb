# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # BetaIssuesV1ListResponse defines the response schema for `/beta/issues/v1/list`.
    class BetaIssuesV1ListResponse < Internal::Types::Model
      field :issues, -> { Internal::Types::Array[Plaid::Types::BetaIssuesV1Issue] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
