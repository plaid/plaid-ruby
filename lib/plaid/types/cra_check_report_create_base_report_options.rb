# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Defines configuration options to generate a Base Report
    class CraCheckReportCreateBaseReportOptions < Internal::Types::Model
      field :client_report_id, -> { String }, optional: true, nullable: true

      field :gse_options, -> { Plaid::Types::CraCheckReportGseOptions }, optional: true, nullable: true

      field :require_identity, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :home_lending_report_options, -> { Plaid::Types::CraCheckReportHomeLendingReportOptions }, optional: true, nullable: true

      field :exclude_transactions, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :base_report_version, -> { Plaid::Types::BaseReportVersion }, optional: true, nullable: true
    end
  end
end
