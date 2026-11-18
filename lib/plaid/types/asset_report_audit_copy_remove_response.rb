# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # AssetReportAuditCopyRemoveResponse defines the response schema for `/asset_report/audit_copy/remove`
    class AssetReportAuditCopyRemoveResponse < Internal::Types::Model
      field :removed, -> { Internal::Types::Boolean }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
