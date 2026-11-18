# frozen_string_literal: true

module Plaid
  module CashflowReport
    module Types
      class CashflowReportInsightsGetRequest < Internal::Types::Model
        field :access_token, -> { String }, optional: false, nullable: false
      end
    end
  end
end
