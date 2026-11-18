# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # BetaIssuesV1SubscribeResponse defines the response schema for `/beta/issues/v1/subscribe`.
    class BetaIssuesV1SubscribeResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
