# frozen_string_literal: true

module Plaid
  module CheckReport
    module Types
      class CraCheckReportIncomeInsightsGetRequest < Internal::Types::Model
        field :user_token, -> { String }, optional: true, nullable: false

        field :third_party_user_token, -> { String }, optional: true, nullable: false

        field :user_id, -> { String }, optional: true, nullable: false

        field :options, -> { Plaid::Types::CraCheckReportIncomeInsightsGetOptions }, optional: true, nullable: true

        field :report_id, -> { String }, optional: true, nullable: false

        field :consumer_report_permissible_purpose, -> { Plaid::Types::CraCheckReportPermissiblePurpose }, optional: true, nullable: false
      end
    end
  end
end
