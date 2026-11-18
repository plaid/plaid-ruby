# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The results of the LendScore
    class LendScore < Internal::Types::Model
      field :score, -> { Integer }, optional: true, nullable: true

      field :reason_codes, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :error_reason, -> { String }, optional: true, nullable: true
    end
  end
end
