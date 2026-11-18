# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SignalScheduleResponse defines the response schema for `/signal/schedule`
    class SignalScheduleResponse < Internal::Types::Model
      field :optimal_date, -> { String }, optional: false, nullable: true

      field :recommendations, -> { Internal::Types::Array[Plaid::Types::SignalScheduleRecommendation] }, optional: false, nullable: false

      field :warnings, -> { Internal::Types::Array[Plaid::Types::SignalWarning] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
