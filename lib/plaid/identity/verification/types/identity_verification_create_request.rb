# frozen_string_literal: true

module Plaid
  module Identity
    module Verification
      module Types
        class IdentityVerificationCreateRequest < Internal::Types::Model
          field :client_user_id, -> { String }, optional: true, nullable: false

          field :user_id, -> { String }, optional: true, nullable: false

          field :is_shareable, -> { Internal::Types::Boolean }, optional: false, nullable: false

          field :template_id, -> { String }, optional: false, nullable: false

          field :language, -> { Plaid::Types::IdentityVerificationLanguage }, optional: true, nullable: true

          field :gave_consent, -> { Internal::Types::Boolean }, optional: false, nullable: false

          field :user, -> { Plaid::Types::IdentityVerificationCreateRequestUser }, optional: true, nullable: true

          field :is_idempotent, -> { Internal::Types::Boolean }, optional: true, nullable: true
        end
      end
    end
  end
end
