# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A JSON Web Key (JWK) that can be used in conjunction with [JWT libraries](https://jwt.io/#libraries-io) to verify
    # Plaid webhooks
    class JwkPublicKey < Internal::Types::Model
      field :alg, -> { String }, optional: false, nullable: false

      field :crv, -> { String }, optional: false, nullable: false

      field :kid, -> { String }, optional: false, nullable: false

      field :kty, -> { String }, optional: false, nullable: false

      field :use, -> { String }, optional: false, nullable: false

      field :x, -> { String }, optional: false, nullable: false

      field :y, -> { String }, optional: false, nullable: false

      field :created_at, -> { Integer }, optional: false, nullable: false

      field :expired_at, -> { Integer }, optional: false, nullable: true
    end
  end
end
