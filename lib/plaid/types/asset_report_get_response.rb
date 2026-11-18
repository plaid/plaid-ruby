# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # AssetReportGetResponse defines the response schema for `/asset_report/get`
    class AssetReportGetResponse < Internal::Types::Model
      field :report, -> { Plaid::Types::AssetReport }, optional: false, nullable: false

      field :warnings, -> { Internal::Types::Array[Plaid::Types::Warning] }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
