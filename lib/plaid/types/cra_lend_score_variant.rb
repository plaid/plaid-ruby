# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CraLendScoreVariant
      extend Plaid::Internal::Types::Enum

      GENERALIST = "GENERALIST"
      AUTO = "AUTO"
      MORTGAGE = "MORTGAGE"
      SHORT_TERM_LOANS = "SHORT_TERM_LOANS"
      ARC = "ARC"
    end
  end
end
