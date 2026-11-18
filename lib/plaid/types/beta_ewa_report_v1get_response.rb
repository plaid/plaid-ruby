# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # BetaEwaReportV1GetResponse defines the response schema for `/beta/ewa_report/v1/get`
    class BetaEwaReportV1GetResponse < Internal::Types::Model
      field :request_id, -> { String }, optional: true, nullable: false

      field :ewa_report_id, -> { String }, optional: true, nullable: false

      field :generation_time, -> { String }, optional: true, nullable: false

      field :ewa_scores, -> { Internal::Types::Array[Plaid::Types::EwaScore] }, optional: true, nullable: false

      field :ewa_attributes, -> { Internal::Types::Hash[String, Float] }, optional: true, nullable: true
    end
  end
end
