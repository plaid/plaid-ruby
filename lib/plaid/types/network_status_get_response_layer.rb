# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing Layer-related metadata for the requested user.
    class NetworkStatusGetResponseLayer < Internal::Types::Model
      field :eligible, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
