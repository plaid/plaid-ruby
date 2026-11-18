# frozen_string_literal: true

module Plaid
  module CheckReport
    module Types
      class CraCheckReportBaseReportGetRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: true, nullable: false

        field :third_party_user_token, -> { String }, optional: true, nullable: false

        field :item_ids, -> { Internal::Types::Array[String] }, optional: true, nullable: true

        field :user_token, -> { String }, optional: true, nullable: false

        field :user_tier, -> { Plaid::Types::CraUserTier }, optional: true, nullable: true

        field :report_id, -> { String }, optional: true, nullable: false

        field :consumer_report_permissible_purpose, -> { Plaid::Types::CraCheckReportPermissiblePurpose }, optional: true, nullable: false
      end
    end
  end
end
