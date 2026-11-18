# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SandboxCraServicingSimulateResponse defines the response schema for `/sandbox/cra/servicing/simulate`
    class SandboxCraServicingSimulateResponse < Internal::Types::Model
      field :report_id, -> { String }, optional: true, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
