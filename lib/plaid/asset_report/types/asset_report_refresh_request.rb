# frozen_string_literal: true

module Plaid
  module AssetReport
    module Types
      class AssetReportRefreshRequest < Internal::Types::Model
        field :asset_report_token, -> { String }, optional: false, nullable: false

        field :days_requested, -> { Integer }, optional: true, nullable: true

        field :options, -> { Plaid::Types::AssetReportRefreshRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
