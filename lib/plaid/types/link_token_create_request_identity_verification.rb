# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Specifies option for initializing Link for use with the Identity Verification product.
    class LinkTokenCreateRequestIdentityVerification < Internal::Types::Model
      field :template_id, -> { String }, optional: false, nullable: false

      field :consent, -> { Internal::Types::Boolean }, optional: true, nullable: false

      field :gave_consent, -> { Internal::Types::Boolean }, optional: true, nullable: false
    end
  end
end
