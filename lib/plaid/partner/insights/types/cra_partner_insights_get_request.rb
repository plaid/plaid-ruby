# frozen_string_literal: true

module Plaid
  module Partner
    module Insights
      module Types
        class CraPartnerInsightsGetRequest < Internal::Types::Model
          field :user_token, -> { String }, optional: false, nullable: false

          field :user_tier, -> { Plaid::Types::CraUserTier }, optional: true, nullable: true
        end
      end
    end
  end
end
