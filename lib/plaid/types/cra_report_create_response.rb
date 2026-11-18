# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraReportCreateResponse defines the response schema for `/cra/report/create`.
    class CraReportCreateResponse < Internal::Types::Model
      field :report_id, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
