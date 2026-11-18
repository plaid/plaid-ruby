# frozen_string_literal: true

module Plaid
  module CashflowReport
    module Types
      class CashflowReportTransactionsGetRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :count, -> { Integer }, optional: true, nullable: false

        field :cursor, -> { String }, optional: true, nullable: false

        field :options, -> { Plaid::Types::CashflowReportTransactionsGetRequestOptions }, optional: true, nullable: false
      end
    end
  end
end
