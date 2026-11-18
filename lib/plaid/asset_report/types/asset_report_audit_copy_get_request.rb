# frozen_string_literal: true

module Plaid
  module AssetReport
    module Types
      class AssetReportAuditCopyGetRequest < Internal::Types::Model
        field :audit_copy_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
