# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional object to filter `/institutions/get` results.
    class InstitutionsGetRequestOptions < Internal::Types::Model
      field :products, -> { Internal::Types::Array[Plaid::Types::Products] }, optional: true, nullable: true

      field :routing_numbers, -> { Internal::Types::Array[String] }, optional: true, nullable: true

      field :oauth, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :include_optional_metadata, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :include_auth_metadata, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :include_payment_initiation_metadata, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
