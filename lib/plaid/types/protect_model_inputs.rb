# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Inputs required by certain Trust Index models. The `link` field is required for link-session models. Other model
    # families (including cash-advance) are identified by `user` alone and do not use this object.
    class ProtectModelInputs < Internal::Types::Model
      field :link, -> { Plaid::Types::ProtectLinkModelInputs }, optional: true, nullable: true

      field :device, -> { Plaid::Types::ProtectDeviceModelInputs }, optional: true, nullable: true
    end
  end
end
