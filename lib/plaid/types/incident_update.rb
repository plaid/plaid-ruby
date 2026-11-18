# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An update on the health incident
    class IncidentUpdate < Internal::Types::Model
      field :description, -> { String }, optional: true, nullable: false

      field :status, -> { Plaid::Types::IncidentUpdateStatus }, optional: true, nullable: false

      field :updated_date, -> { String }, optional: true, nullable: false
    end
  end
end
