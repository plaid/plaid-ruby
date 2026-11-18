# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # UserAccountSessionEventSendResponse defines the response schema for `/user_account/session/event/send`
    class UserAccountSessionEventSendResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
