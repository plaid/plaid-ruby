# frozen_string_literal: true

module Plaid
  module CheckReport
    module Types
      class CraCheckReportLendScoreGetRequest < Internal::Types::Model
        field :user_id, -> { String }, optional: true, nullable: false

        field :third_party_user_token, -> { String }, optional: true, nullable: false

        field :user_token, -> { String }, optional: true, nullable: false

        field :options, -> { Plaid::Types::CraCheckReportLendScoreGetOptions }, optional: true, nullable: true
      end
    end
  end
end
