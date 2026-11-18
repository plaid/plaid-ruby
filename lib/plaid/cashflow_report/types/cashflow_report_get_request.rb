# frozen_string_literal: true

module Plaid
  module CashflowReport
    module Types
      class CashflowReportGetRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :days_requested, -> { Integer }, optional: false, nullable: false

        field :count, -> { Integer }, optional: true, nullable: false

        field :cursor, -> { String }, optional: true, nullable: false

        field :options, -> { Plaid::Types::CashflowReportGetRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
