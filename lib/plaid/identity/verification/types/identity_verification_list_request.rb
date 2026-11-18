# frozen_string_literal: true

module Plaid
  module Identity
    module Verification
      module Types
        class IdentityVerificationListRequest < Internal::Types::Model
          field :template_id, -> { String }, optional: false, nullable: false

          field :client_user_id, -> { String }, optional: true, nullable: false

          field :user_id, -> { String }, optional: true, nullable: true

          field :cursor, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
