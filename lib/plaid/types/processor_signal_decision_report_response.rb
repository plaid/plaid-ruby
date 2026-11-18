# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProcessorSignalDecisionReportResponse defines the response schema for `/processor/signal/decision/report`
    class ProcessorSignalDecisionReportResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
