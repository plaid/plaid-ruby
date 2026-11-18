# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # IssuesSubscribeResponse defines the response schema for `/issues/subscribe`.
    class IssuesSubscribeResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
