# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Response object for /protect/user/insights/get
    class ProtectUserInsightsGetResponse < Internal::Types::Model
      field :user_id, -> { String }, optional: false, nullable: false

      field :latest_scored_event, -> { Plaid::Types::LatestScoredEvent }, optional: false, nullable: true

      field :reports, -> { Internal::Types::Array[Plaid::Types::ProtectReport] }, optional: true, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
