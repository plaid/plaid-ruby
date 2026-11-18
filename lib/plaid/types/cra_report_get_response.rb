# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # CraReportGetResponse defines the response schema for `/cra/report/get`.
    class CraReportGetResponse < Internal::Types::Model
      field :report, -> { Plaid::Types::CraReportGetReport }, optional: false, nullable: false

      field :request_id, -> { String }, optional: false, nullable: false

      field :user_id, -> { String }, optional: false, nullable: false

      field :client_user_id, -> { String }, optional: false, nullable: true

      field :warnings, -> { Internal::Types::Array[Plaid::Types::CheckReportWarning] }, optional: false, nullable: false
    end
  end
end
