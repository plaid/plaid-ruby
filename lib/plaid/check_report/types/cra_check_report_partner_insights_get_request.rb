# frozen_string_literal: true

module Plaid
  module CheckReport
    module Types
      class CraCheckReportPartnerInsightsGetRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: true, nullable: false

        field :third_party_user_token, -> { String }, optional: true, nullable: false

        field :user_token, -> { String }, optional: true, nullable: false

        field :user_tier, -> { Plaid::Types::CraUserTier }, optional: true, nullable: true

        field :partner_insights, -> { Plaid::Types::CraCheckReportPartnerInsightsGetPartnerInsights }, optional: true, nullable: false

        field :options, -> { Plaid::Types::CraCheckReportPartnerInsightsGetOptions }, optional: true, nullable: true
      end
    end
  end
end
