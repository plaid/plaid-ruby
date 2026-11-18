# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Names the Network Insights product at a given version.
    class CraNetworkInsightsProduct < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false
    end
  end
end
