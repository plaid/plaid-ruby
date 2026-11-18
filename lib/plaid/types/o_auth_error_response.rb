# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # OAuth error response
    class OAuthErrorResponse < Internal::Types::Model
      field :error, -> { Plaid::Types::OAuthErrorCode }, optional: true, nullable: false

      field :error_description, -> { String }, optional: true, nullable: false

      field :error_uri, -> { String }, optional: true, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
