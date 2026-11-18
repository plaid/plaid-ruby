# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # SignalReturnReportResponse defines the response schema for `/signal/return/report`
    class SignalReturnReportResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
