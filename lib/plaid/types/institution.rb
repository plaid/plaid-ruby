# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Details relating to a specific financial institution
    class Institution < Internal::Types::Model
      field :institution_id, -> { String }, optional: false, nullable: false

      field :name, -> { String }, optional: false, nullable: false

      field :products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: false, nullable: false

      field :country_codes, -> { Internal::Types::Array[Plaid::Types::CountryCode] }, optional: false, nullable: false

      field :url, -> { String }, optional: true, nullable: true

      field :primary_color, -> { String }, optional: true, nullable: true

      field :logo, -> { String }, optional: true, nullable: true

      field :routing_numbers, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :dtc_numbers, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :oauth, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :connection_availability, -> { Plaid::Types::InstitutionConnectionAvailability }, optional: false, nullable: false

      field :status, -> { Plaid::Types::InstitutionStatus }, optional: true, nullable: true

      field :payment_initiation_metadata, -> { Plaid::Types::PaymentInitiationMetadata }, optional: true, nullable: true

      field :auth_metadata, -> { Plaid::Types::AuthMetadata }, optional: true, nullable: true
    end
  end
end
