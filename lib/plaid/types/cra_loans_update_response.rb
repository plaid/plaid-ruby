# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraLoansUpdateResponse defines the response schema for `/cra/loans/update`.
    class CraLoansUpdateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
