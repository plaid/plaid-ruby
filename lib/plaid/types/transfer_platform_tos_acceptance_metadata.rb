# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Metadata related to the acceptance of Terms of Service
    class TransferPlatformTosAcceptanceMetadata < Internal::Types::Model
      field :agreement_accepted, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :originator_ip_address, -> { String }, optional: false, nullable: false

      field :agreement_accepted_at, -> { String }, optional: false, nullable: false
    end
  end
end
