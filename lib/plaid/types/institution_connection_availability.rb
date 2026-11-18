# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module InstitutionConnectionAvailability
      extend Plaid::Internal::Types::Enum

      SUPPORTED = "SUPPORTED"
      NOT_SUPPORTED = "NOT_SUPPORTED"
    end
  end
end
