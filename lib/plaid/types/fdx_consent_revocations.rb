# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The revocation history of a consent grant. Response body for GET /fdx/consents/{consentId}/revocation.
    class FdxConsentRevocations < Internal::Types::Model
      field :revocations, -> { Internal::Types::Array[Plaid::Types::FdxConsentRevocationRecord] }, optional: false, nullable: false
    end
  end
end
