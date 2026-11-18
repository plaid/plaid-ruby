# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BusinessResidentialIndicator
      extend Plaid::Internal::Types::Enum

      RESIDENTIAL = "residential"
      COMMERCIAL = "commercial"
    end
  end
end
