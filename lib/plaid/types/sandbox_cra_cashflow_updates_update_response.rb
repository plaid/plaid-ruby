# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SandboxCraCashflowUpdatesUpdateResponse defines the response schema for `/sandbox/cra/cashflow_updates/update`
    class SandboxCraCashflowUpdatesUpdateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
