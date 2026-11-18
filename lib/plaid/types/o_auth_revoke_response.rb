# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Successful OAuth token revoke response
    class OAuthRevokeResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
