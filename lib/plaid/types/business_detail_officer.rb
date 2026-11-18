# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An officer the data provider attributes to the business.
    class BusinessDetailOfficer < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: true

      field :titles, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :jurisdictions, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :sources, -> { Internal::Types::Array[Plaid::Types::BusinessEntitySource] }, optional: false, nullable: false
    end
  end
end
