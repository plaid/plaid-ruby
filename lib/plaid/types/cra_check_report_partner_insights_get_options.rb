# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Deprecated, specify `partner_insights.prism_versions` instead.
    class CraCheckReportPartnerInsightsGetOptions < Internal::Types::Model
      field :prism_versions, -> { Plaid::Types::PrismVersionsDeprecated }, optional: true, nullable: true
    end
  end
end
