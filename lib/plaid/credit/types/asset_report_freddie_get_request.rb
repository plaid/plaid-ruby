# frozen_string_literal: true

module Plaid
  module Credit
    module Types
      class AssetReportFreddieGetRequest < Internal::Types::Model
        field :audit_copy_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
