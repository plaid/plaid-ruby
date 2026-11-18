# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Configuration parameters for the Cashflow Report product. Currently in closed beta.
    class LinkTokenCashflowReport < Internal::Types::Model
      field :days_requested, -> { Integer }, optional: true, nullable: false
    end
  end
end
