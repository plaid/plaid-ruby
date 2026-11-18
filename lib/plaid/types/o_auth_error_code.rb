# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module OAuthErrorCode
      extend Plaid::Internal::Types::Enum

      INVALID_REQUEST = "invalid_request"
      INVALID_CLIENT = "invalid_client"
      INVALID_GRANT = "invalid_grant"
      UNAUTHORIZED_CLIENT = "unauthorized_client"
      INVALID_SCOPE = "invalid_scope"
      UNSUPPORTED_GRANT_TYPE = "unsupported_grant_type"
    end
  end
end
