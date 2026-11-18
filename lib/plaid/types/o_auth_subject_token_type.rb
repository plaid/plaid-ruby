# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module OAuthSubjectTokenType
      extend Plaid::Internal::Types::Enum

      URN_PLAID_PARAMS_TOKENS_USER = "urn:plaid:params:tokens:user"
      URN_PLAID_PARAMS_OAUTH_USER_TOKEN = "urn:plaid:params:oauth:user-token"
      URN_PLAID_PARAMS_CREDIT_MULTI_USER = "urn:plaid:params:credit:multi-user"
    end
  end
end
