# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraPartnerInsightsGetResponse defines the response schema for `/cra/partner_insights/get`.
    class CraPartnerInsightsGetResponse < Internal::Types::Model
      field :report, -> { Internal::Types::Array[Plaid::Types::CraPartnerInsights] }, optional: true, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
