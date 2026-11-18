# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The monetary amount associated with the incident.
    class ProtectIncidentAmount < Internal::Types::Model
      field :iso_currency_code, -> { String }, optional: true, nullable: true

      field :value, -> { Float }, optional: false, nullable: false
    end
  end
end
