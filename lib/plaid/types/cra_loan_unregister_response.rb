# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraLoanUnregisterResponse defines the response schema for `/cra/loans/unregister`.
    class CraLoanUnregisterResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
