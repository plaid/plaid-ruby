# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The Check Income Insights Report for an end user.
    class CraIncomeInsights < Internal::Types::Model
      field :report_id, -> { String }, optional: true, nullable: false

      field :generated_time, -> { String }, optional: true, nullable: false

      field :days_requested, -> { Integer }, optional: true, nullable: false

      field :client_report_id, -> { String }, optional: true, nullable: true

      field :items, -> { Internal::Types::Array[Plaid::Types::CraBankIncomeItem] }, optional: true, nullable: false

      field :user_summary, -> { Plaid::Types::CraIncomeInsightsUserSummary }, optional: true, nullable: true

      field :income_streams, -> { Internal::Types::Array[Plaid::Types::CraIncomeStream] }, optional: false, nullable: false

      field :bank_income_summary, -> { Plaid::Types::CraBankIncomeSummary }, optional: true, nullable: false

      field :warnings, -> { Internal::Types::Array[Plaid::Types::CraBankIncomeWarning] }, optional: true, nullable: false
    end
  end
end
