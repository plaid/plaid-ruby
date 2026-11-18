# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Describes a historical log of user consent events.
    class ItemActivityListResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false

      field :activities, -> { Internal::Types::Array[Plaid::Types::Activity] }, optional: false, nullable: false

      field :last_data_access_times, -> { Internal::Types::Array[Plaid::Types::ApplicationLastDataAccessTimes] }, optional: false, nullable: false

      field :cursor, -> { String }, optional: true, nullable: false
    end
  end
end
