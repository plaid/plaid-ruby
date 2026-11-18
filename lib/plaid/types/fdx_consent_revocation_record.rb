# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # One revocation record on a consent grant, mirroring the FDX ConsentRevocation entity.
    class FdxConsentRevocationRecord < Internal::Types::Model
      field :status, -> { Plaid::Types::FdxConsentGrantStatus }, optional: false, nullable: false

      field :reason, -> { Plaid::Types::FdxUpdateReason }, optional: false, nullable: false

      field :initiator, -> { Plaid::Types::FdxPartyType }, optional: false, nullable: false

      field :updated_time, -> { String }, optional: false, nullable: false, api_name: "updatedTime"
    end
  end
end
