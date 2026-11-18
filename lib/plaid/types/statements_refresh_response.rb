# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # StatementsRefreshResponse defines the response schema for `/statements/refresh`
    class StatementsRefreshResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
