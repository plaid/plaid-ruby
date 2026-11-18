# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CraBankIncomeBonusType
      extend Plaid::Internal::Types::Enum

      BONUS_INCLUDED = "BONUS_INCLUDED"
      BONUS_ONLY = "BONUS_ONLY"
    end
  end
end
