# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module LinkTokenCreateRequestAppearanceMode
      extend Plaid::Internal::Types::Enum

      LIGHT = "LIGHT"
      DARK = "DARK"
      SYSTEM = "SYSTEM"
    end
  end
end
