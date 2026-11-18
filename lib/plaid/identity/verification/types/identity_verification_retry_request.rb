# frozen_string_literal: true

module Plaid
  module Identity
    module Verification
      module Types
        class IdentityVerificationRetryRequest < Internal::Types::Model
          field :client_user_id, -> { String }, optional: false, nullable: false

          field :template_id, -> { String }, optional: false, nullable: false

          field :strategy, -> { Plaid::Types::Strategy }, optional: false, nullable: false

          field :user, -> { Plaid::Types::IdentityVerificationRequestUser }, optional: true, nullable: true

          field :steps, -> { Plaid::Types::IdentityVerificationRetryRequestStepsObject }, optional: true, nullable: true

          field :is_shareable, -> { Internal::Types::Boolean }, optional: true, nullable: true
        end
      end
    end
  end
end
