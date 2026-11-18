# frozen_string_literal: true

module Plaid
  module Identity
    module Verification
      module Types
        class IdentityVerificationAutofillCreateRequest < Internal::Types::Model
          field :identity_verification_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
