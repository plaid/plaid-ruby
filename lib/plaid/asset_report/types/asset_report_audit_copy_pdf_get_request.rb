# frozen_string_literal: true

module Plaid
  module AssetReport
    module Types
      class AssetReportAuditCopyPdfGetRequest < Internal::Types::Model
        field :audit_copy_token, -> { String }, optional: false, nullable: false

        field :options, -> { Plaid::Types::AssetReportPdfGetRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
