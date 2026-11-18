# frozen_string_literal: true

module Plaid
  module Sandbox
    module Types
      class SandboxItemSetVerificationStatusRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :account_id, -> { String }, optional: false, nullable: false

        field :verification_status, -> { Plaid::Sandbox::Types::SandboxItemSetVerificationStatusRequestVerificationStatus }, optional: false, nullable: false
      end
    end
  end
end
