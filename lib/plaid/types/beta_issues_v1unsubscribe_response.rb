# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # BetaIssuesV1UnsubscribeResponse defines the response schema for `/beta/issues/v1/unsubscribe`.
    class BetaIssuesV1UnsubscribeResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
