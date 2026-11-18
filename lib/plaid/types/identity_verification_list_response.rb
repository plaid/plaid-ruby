# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Paginated list of Plaid sessions.
    class IdentityVerificationListResponse < Internal::Types::Model
      field :identity_verifications, -> { Internal::Types::Array[Plaid::Types::IdentityVerification] }, optional: false, nullable: false

      field :next_cursor, -> { String }, optional: false, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
