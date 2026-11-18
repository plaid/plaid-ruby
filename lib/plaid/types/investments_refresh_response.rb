# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # InvestmentsRefreshResponse defines the response schema for `/investments/refresh`
    class InvestmentsRefreshResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
