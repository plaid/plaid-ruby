# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CreditRelayRefreshResponse defines the response schema for `/credit/relay/refresh`
    class CreditRelayRefreshResponse < Internal::Types::Model
      field :relay_token, -> { String }, optional: false, nullable: false

      field :asset_report_id, -> { String }, optional: true, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
