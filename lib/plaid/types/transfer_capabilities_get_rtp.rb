# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Contains the supported service types in RTP
    class TransferCapabilitiesGetRtp < Internal::Types::Model
      field :credit, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
