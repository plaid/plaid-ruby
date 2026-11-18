# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CraUltraFicoBureau
      extend Plaid::Internal::Types::Enum

      EQUIFAX = "EQUIFAX"
      EXPERIAN = "EXPERIAN"
      TRANSUNION = "TRANSUNION"
    end
  end
end
