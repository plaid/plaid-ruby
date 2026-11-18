# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Metadata specifically related to which auth methods an institution supports.
    class AuthSupportedMethods < Internal::Types::Model
      field :instant_auth, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :instant_match, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :automated_micro_deposits, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :instant_micro_deposits, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
