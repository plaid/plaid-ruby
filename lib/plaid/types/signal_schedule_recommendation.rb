# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Conveys information on if a retry is recommended on a given date
    class SignalScheduleRecommendation < Internal::Types::Model
      field :date, -> { String }, optional: true, nullable: false

      field :recommendation, -> { Plaid::Types::RecommendationString }, optional: true, nullable: false

      field :rank, -> { Integer }, optional: true, nullable: true
    end
  end
end
