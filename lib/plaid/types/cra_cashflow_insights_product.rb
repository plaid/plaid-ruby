# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Names the Cashflow Insights product at a given version.
    class CraCashflowInsightsProduct < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false
    end
  end
end
