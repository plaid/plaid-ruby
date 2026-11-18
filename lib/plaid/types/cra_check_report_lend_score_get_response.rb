# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraCheckReportLendScoreGetResponse defines the response schema for `/cra/check_report/lend_score/get`.
    class CraCheckReportLendScoreGetResponse < Internal::Types::Model
      field :report, -> { Plaid::Types::CraLendScoreReport }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false

      field :warnings, -> { Internal::Types::Array[Plaid::Types::CheckReportWarning] }, optional: true, nullable: false
    end
  end
end
