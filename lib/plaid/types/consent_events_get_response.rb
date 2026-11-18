# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Describes a historical log of item consent events.
    class ConsentEventsGetResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :consent_events, -> { Internal::Types::Array[Plaid::Types::ConsentEvent] }, optional: false, nullable: false
    end
  end
end
