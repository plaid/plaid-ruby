# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An optional object to filter `/institutions/search` results.
    class InstitutionsSearchRequestOptions < Internal::Types::Model
      field :oauth, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :include_optional_metadata, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :include_auth_metadata, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :include_payment_initiation_metadata, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :payment_initiation, -> { Plaid::Types::InstitutionsSearchPaymentInitiationOptions }, optional: true, nullable: true
    end
  end
end
