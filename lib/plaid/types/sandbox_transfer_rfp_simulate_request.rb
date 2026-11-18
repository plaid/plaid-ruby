# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the request schema for `/sandbox/transfer/rfp/simulate`
    class SandboxTransferRfpSimulateRequest < Internal::Types::Model
      field :transfer_id, -> { String }, optional: false, nullable: false

      field :action, -> { Plaid::Types::SandboxTransferRfpSimulateAction }, optional: false, nullable: false

      field :amount, -> { String }, optional: false, nullable: false

      field :client_name, -> { String }, optional: false, nullable: false
    end
  end
end
