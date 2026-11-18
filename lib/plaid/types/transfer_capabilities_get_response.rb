# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines the response schema for `/transfer/capabilities/get`
    class TransferCapabilitiesGetResponse < Internal::Types::Model
      field :institution_supported_networks, -> { Plaid::Types::InstitutionSupportedNetworks }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
