# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CreditSessionsGetResponse defines the response schema for `/credit/sessions/get`
    class CreditSessionsGetResponse < Internal::Types::Model
      field :sessions, -> { Internal::Types::Array[Plaid::Types::CreditSession] }, optional: true, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
