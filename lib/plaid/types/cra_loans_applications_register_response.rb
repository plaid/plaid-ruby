# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraLoansApplicationsRegisterResponse defines the response schema for `/cra/loans/applications/register`.
    class CraLoansApplicationsRegisterResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
