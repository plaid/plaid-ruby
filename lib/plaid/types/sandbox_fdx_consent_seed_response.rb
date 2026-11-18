# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Response containing the identifier of the seeded FDX consent grant, which can then be listed, retrieved, and
    # revoked through the FDX Consent API.
    class SandboxFdxConsentSeedResponse < Internal::Types::Model
      field :consent_id, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
