# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxFdxConsentSeedRequest < Internal::Types::Model
        field :customer_id, -> { String }, optional: false, nullable: false

        field :application_id, -> { String }, optional: false, nullable: false

        field :consent_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
