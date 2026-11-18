# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module CraPartnerInsightsBureau
      extend Plaid::Internal::Types::Enum

      EQUIFAX = "EQUIFAX"
      EXPERIAN = "EXPERIAN"
      TRANSUNION = "TRANSUNION"
    end
  end
end
