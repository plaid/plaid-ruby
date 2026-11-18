# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # AssetReportAuditCopyCreateResponse defines the response schema for `/asset_report/audit_copy/create`
    class AssetReportAuditCopyCreateResponse < Internal::Types::Model
      field :audit_copy_token, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
