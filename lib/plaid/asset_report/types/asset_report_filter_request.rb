# frozen_string_literal: true

module Plaid
  module AssetReport
    module Types
      class AssetReportFilterRequest < Internal::Types::Model
        field :asset_report_token, -> { String }, optional: false, nullable: false

        field :account_ids_to_exclude, -> { Internal::Types::Array[String] }, optional: false, nullable: false
      end
    end
  end
end
