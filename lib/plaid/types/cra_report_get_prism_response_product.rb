# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Prism data returned by `/cra/report/get`.
    class CraReportGetPrismResponseProduct < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :metadata, -> { Plaid::Types::CraReportGetPrismMetadata }, optional: false, nullable: true

      field :prism, -> { Plaid::Types::CraReportGetPrism }, optional: false, nullable: false

      field :items, -> { Internal::Types::Array[Plaid::Types::CraReportGetPrismItem] }, optional: false, nullable: false

      field :errors, -> { Internal::Types::Array[Plaid::Types::PlaidError] }, optional: false, nullable: false
    end
  end
end
