# frozen_string_literal: true

module Plaid
  module Fdx
    module Types
      class FdxConsentRevocation < Internal::Types::Model
        field :consent_id, -> { String }, optional: false, nullable: false, api_name: "consentId"

        field :initiator, -> { Plaid::Types::FdxPartyType }, optional: false, nullable: false

        field :reason, -> { Plaid::Types::FdxUpdateReason }, optional: false, nullable: false

        field :other_reason, -> { String }, optional: true, nullable: false, api_name: "otherReason"

        field :updated_time, -> { String }, optional: true, nullable: false, api_name: "updatedTime"
      end
    end
  end
end
