# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An individual LendScore result within a credit profile report.
    class CraCreditProfileLendScore < Internal::Types::Model
      field :score, -> { Integer }, optional: false, nullable: true

      field :reason_codes, -> { Internal::Types::Array[String] }, optional: false, nullable: false

      field :variant, -> { String }, optional: false, nullable: false

      field :error_reason, -> { String }, optional: false, nullable: true
    end
  end
end
