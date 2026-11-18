# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The latest scored event for a user.
    class LatestScoredEvent < Internal::Types::Model
      field :event_id, -> { String }, optional: false, nullable: false

      field :timestamp, -> { String }, optional: false, nullable: false

      field :event_type, -> { String }, optional: true, nullable: false

      field :trust_index, -> { Plaid::Types::TrustIndex }, optional: false, nullable: true

      field :fraud_attributes, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: true
    end
  end
end
