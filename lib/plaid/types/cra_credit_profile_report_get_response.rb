# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraCreditProfileReportGetResponse defines the response schema for `/cra/credit_profile/report/get`.
    class CraCreditProfileReportGetResponse < Internal::Types::Model
      field :report, -> { Plaid::Types::CraCreditProfileReport }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: true, nullable: false

      field :warnings, -> { Internal::Types::Array[Plaid::Types::CheckReportWarning] }, optional: false, nullable: false
    end
  end
end
