# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraCheckReportVerificationGetResponse defines the response schema for `/cra/check_report/verification/get`.
    class CraCheckReportVerificationGetResponse < Internal::Types::Model
      field :report, -> { Plaid::Types::CraVerificationReport }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false

      field :warnings, -> { Internal::Types::Array[Plaid::Types::CheckReportWarning] }, optional: false, nullable: false
    end
  end
end
