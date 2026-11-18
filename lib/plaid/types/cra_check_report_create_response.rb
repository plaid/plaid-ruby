# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraCheckReportCreateResponse defines the response schema for `/cra/check_report/create`.
    class CraCheckReportCreateResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: true, nullable: false
    end
  end
end
