# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # A JWT Header, used for webhook validation
    class JwtHeader < Internal::Types::Model
      field :id, -> { String }, optional: false, nullable: false

      field :kid, -> { String }, optional: false, nullable: false

      field :alg, -> { String }, optional: false, nullable: false
    end
  end
end
