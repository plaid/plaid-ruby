# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module OwnershipType
      extend Plaid::Internal::Types::Enum

      INDIVIDUAL = "individual"
      JOINT = "joint"
      ASSOCIATION = "association"
      TRUST = "trust"
    end
  end
end
