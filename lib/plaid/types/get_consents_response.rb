# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # GetConsentsResponse defines the response schema for `/fdx/consents`
    class GetConsentsResponse < Internal::Types::Model
      field :consent_grants, -> { Internal::Types::Array[Plaid::Types::FdxConsentGrant] }, optional: false, nullable: false
    end
  end
end
