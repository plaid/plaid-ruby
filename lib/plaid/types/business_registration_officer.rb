# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An officer listed on a registration.
    class BusinessRegistrationOfficer < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: true

      field :titles, -> { Internal::Types::Array[String] }, optional: false, nullable: false
    end
  end
end
