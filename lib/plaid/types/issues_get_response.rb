# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # IssuesGetResponse defines the response schema for `/issues/get`.
    class IssuesGetResponse < Internal::Types::Model
      field :issue, -> { Plaid::Types::Issue }, optional: true, nullable: false

      field :request_id, -> { String }, optional: true, nullable: false
    end
  end
end
