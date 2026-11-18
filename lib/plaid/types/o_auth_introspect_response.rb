# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # OAuth token introspect response
    class OAuthIntrospectResponse < Internal::Types::Model
      field :active, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :scope, -> { String }, optional: true, nullable: false

      field :client_id, -> { String }, optional: true, nullable: false

      field :exp, -> { Integer }, optional: true, nullable: false

      field :iat, -> { Integer }, optional: true, nullable: false

      field :sub, -> { String }, optional: true, nullable: false

      field :aud, -> { String }, optional: true, nullable: false

      field :iss, -> { String }, optional: true, nullable: false

      field :token_type, -> { String }, optional: true, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
