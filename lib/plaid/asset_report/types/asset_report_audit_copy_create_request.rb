# frozen_string_literal: true

module Plaid
  module AssetReport
    module Types
      class AssetReportAuditCopyCreateRequest < Internal::Types::Model
        field :asset_report_token, -> { String }, optional: false, nullable: false

        field :auditor_id, -> { String }, optional: true, nullable: false
      end
    end
  end
end
