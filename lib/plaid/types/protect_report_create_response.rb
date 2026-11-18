# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Response object for /protect/report/create
    class ProtectReportCreateResponse < Internal::Types::Model
      field :report_id, -> { String }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false
    end
  end
end
