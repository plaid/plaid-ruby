# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains the RTP and RfP network and types supported by the linked Item's institution.
    class InstitutionSupportedNetworks < Internal::Types::Model
      field :rtp, -> { Plaid::Types::TransferCapabilitiesGetRtp }, optional: false, nullable: false

      field :rfp, -> { Plaid::Types::TransferCapabilitiesGetRfP }, optional: false, nullable: false
    end
  end
end
