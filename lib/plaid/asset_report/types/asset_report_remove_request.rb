# frozen_string_literal: true

module Plaid
  module AssetReport
    module Types
      class AssetReportRemoveRequest < Internal::Types::Model
        field :asset_report_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
