# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # UltraFICO data returned by `/cra/report/get`.
    class CraReportGetUltraFicoResponseProduct < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :metadata, -> { Plaid::Types::CraReportGetUltraFicoMetadata }, optional: false, nullable: true

      field :ultrafico, -> { Plaid::Types::CraReportGetUltraFico }, optional: false, nullable: true

      field :items, -> { Internal::Types::Array[Plaid::Types::CraReportGetUltraFicoItem] }, optional: false, nullable: false

      field :errors, -> { Internal::Types::Array[Plaid::Types::PlaidError] }, optional: false, nullable: false
    end
  end
end
