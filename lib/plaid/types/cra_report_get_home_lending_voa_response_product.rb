# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Home Lending VOA data returned by `/cra/report/get`.
    class CraReportGetHomeLendingVoaResponseProduct < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :metadata, -> { Plaid::Types::CraReportGetHomeLendingVoaMetadata }, optional: false, nullable: true

      field :gse_reference_id, -> { String }, optional: false, nullable: true

      field :items, -> { Internal::Types::Array[Plaid::Types::CraReportGetHomeLendingVoaItem] }, optional: false, nullable: false

      field :attributes, -> { Plaid::Types::CraReportGetHomeLendingVoaAttributes }, optional: true, nullable: true

      field :errors, -> { Internal::Types::Array[Plaid::Types::PlaidError] }, optional: false, nullable: false
    end
  end
end
