# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SignalDecisionReportResponse defines the response schema for `/signal/decision/report`
    class SignalDecisionReportResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
