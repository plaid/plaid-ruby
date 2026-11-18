# frozen_string_literal: true

module Plaid
  module CashflowReport
    module Types
      class CashflowReportRefreshRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false

        field :days_requested, -> { Integer }, optional: false, nullable: false
      end
    end
  end
end
