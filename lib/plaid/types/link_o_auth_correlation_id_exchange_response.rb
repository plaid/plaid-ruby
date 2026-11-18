# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # LinkOAuthCorrelationIdExchangeResponse defines the response schema for `/link/oauth/correlation_id/exchange`
    class LinkOAuthCorrelationIDExchangeResponse < Internal::Types::Model
      field :link_token, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
