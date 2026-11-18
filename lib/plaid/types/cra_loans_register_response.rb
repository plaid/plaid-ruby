# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraLoansRegisterResponse defines the response schema for `/cra/loans/register`.
    class CraLoansRegisterResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
