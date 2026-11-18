# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # UserAccountSessionGetResponse defines the response schema for `/user_account/session/get`
    class UserAccountSessionGetResponse < Internal::Types::Model
      field :idv_session_status, -> { Plaid::Types::IdentityVerificationStatus }, optional: true, nullable: false

      field :link_session_id, -> { String }, optional: false, nullable: true

      field :identity, -> { Plaid::Types::UserAccountIdentity }, optional: false, nullable: true

      field :items, -> { Internal::Types::Array[Plaid::Types::UserAccountItem] }, optional: false, nullable: false

      field :identity_edit_history, -> { Plaid::Types::UserAccountIdentityEditHistory }, optional: true, nullable: true

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
