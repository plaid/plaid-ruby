# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A status health incident
    class HealthIncident < Internal::Types::Model
      field :start_date, -> { String }, optional: false, nullable: false

      field :end_date, -> { String }, optional: true, nullable: true

      field :title, -> { String }, optional: false, nullable: false

      field :incident_updates, -> { Internal::Types::Array[Plaid::Types::IncidentUpdate] }, optional: false, nullable: true
    end
  end
end
