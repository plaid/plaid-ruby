# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Originator and their status.
    class DetailedOriginator < Internal::Types::Model
      field :client_id, -> { String }, optional: false, nullable: false

      field :transfer_diligence_status, -> { Plaid::Types::TransferDiligenceStatus }, optional: false, nullable: false

      field :company_name, -> { String }, optional: false, nullable: false

      field :outstanding_requirements, -> { Internal::Types::Array[Plaid::Types::TransferPlatformRequirement] }, optional: true, nullable: false
    end
  end
end
