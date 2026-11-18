# frozen_string_literal: true

module Plaid
  module CheckReport
    module Types
      class CraCheckReportPdfGetRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: true, nullable: false

        field :third_party_user_token, -> { String }, optional: true, nullable: false

        field :add_ons, -> { Internal::Types::Array[Plaid::Types::CraPdfAddOns] }, optional: true, nullable: false

        field :user_token, -> { String }, optional: true, nullable: false
      end
    end
  end
end
