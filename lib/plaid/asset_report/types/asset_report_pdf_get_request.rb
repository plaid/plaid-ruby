# frozen_string_literal: true

module Plaid
  module AssetReport
    module Types
      class AssetReportPdfGetRequest < Internal::Types::Model
        field :asset_report_token, -> { String }, optional: false, nullable: false

        field :options, -> { Plaid::Types::AssetReportPdfGetRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
