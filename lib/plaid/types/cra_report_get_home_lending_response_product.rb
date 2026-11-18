# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Home Lending data returned by `/cra/report/get`.
    class CraReportGetHomeLendingResponseProduct < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :metadata, -> { Plaid::Types::CraReportGetHomeLendingMetadata }, optional: false, nullable: true

      field :attributes, -> { Plaid::Types::CraReportGetHomeLendingAttributes }, optional: false, nullable: true

      field :items, -> { Internal::Types::Array[Plaid::Types::CraReportGetHomeLendingItem] }, optional: false, nullable: false

      field :errors, -> { Internal::Types::Array[Plaid::Types::PlaidError] }, optional: false, nullable: false
    end
  end
end
