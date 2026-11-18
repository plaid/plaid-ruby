# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # OAuth token grant success response
    class OAuthTokenResponse < Internal::Types::Model
      field :access_token, -> { String }, optional: false, nullable: false

      field :refresh_token, -> { String }, optional: false, nullable: false

      field :token_type, -> { String }, optional: false, nullable: false

      field :expires_in, -> { Integer }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
