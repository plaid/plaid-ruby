# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Base Report data returned by `/cra/report/get`.
    class CraReportGetBaseReportResponseProduct < Internal::Types::Model
      field :version, -> { String }, optional: false, nullable: false

      field :metadata, -> { Plaid::Types::CraReportGetBaseReportMetadata }, optional: false, nullable: true

      field :items, -> { Internal::Types::Array[Plaid::Types::CraReportGetBaseReportItem] }, optional: false, nullable: false

      field :attributes, -> { Plaid::Types::CraReportGetBaseReportAttributes }, optional: true, nullable: true

      field :errors, -> { Internal::Types::Array[Plaid::Types::PlaidError] }, optional: false, nullable: false
    end
  end
end
