# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module OAuthGrantType
      extend Plaid::Internal::Types::Enum

      REFRESH_TOKEN = "refresh_token"
      URN_IETF_PARAMS_OAUTH_GRANT_TYPE_TOKEN_EXCHANGE = "urn:ietf:params:oauth:grant-type:token-exchange"
      CLIENT_CREDENTIALS = "client_credentials"
    end
  end
end
