# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An arbitrary JSON payload sent to or received from the Plaid server. Internal use only.
    class ForwardedJSONResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
