# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The data from the CashScore® Extend product returned by Prism Data.
    class PrismExtend < Internal::Types::Model
      field :model_version, -> { String }, optional: false, nullable: false

      field :score, -> { Integer }, optional: false, nullable: true

      field :reason_codes, -> { Internal::Types::Array[String] }, optional: true, nullable: false

      field :metadata, -> { Plaid::Types::PrismCashScoreMetadata }, optional: true, nullable: false

      field :error_reason, -> { String }, optional: true, nullable: false
    end
  end
end
