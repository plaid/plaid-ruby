# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # ProcessorSignalReturnReportResponse defines the response schema for `/processor/signal/return/report`
    class ProcessorSignalReturnReportResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
