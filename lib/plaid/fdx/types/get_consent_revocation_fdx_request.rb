# frozen_string_literal: true

module Plaid
  module Fdx
    module Types
      class GetConsentRevocationFdxRequest < Internal::Types::Model
        field :consent_id, -> { String }, optional: false, nullable: false, api_name: "consentId"
      end
    end
  end
end
