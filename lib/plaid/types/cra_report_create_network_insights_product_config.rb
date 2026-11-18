# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Requests the given version of the Network Insights product. Network Insights accepts no additional configuration
    # today.
    class CraReportCreateNetworkInsightsProductConfig < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false
    end
  end
end
