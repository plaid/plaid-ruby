# frozen_string_literal: true

module Plaid
  module CheckReport
    module Types
      class CraCheckReportNetworkInsightsGetRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: true, nullable: false

        field :options, -> { Plaid::Types::CraCheckReportNetworkInsightsGetOptions }, optional: true, nullable: true

        field :third_party_user_token, -> { String }, optional: true, nullable: false

        field :user_token, -> { String }, optional: true, nullable: false
      end
    end
  end
end
