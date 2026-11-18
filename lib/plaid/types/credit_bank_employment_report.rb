# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # The report of the Bank Employment data for an end user.
    class CreditBankEmploymentReport < Internal::Types::Model
      field :bank_employment_report_id, -> { String }, optional: false, nullable: false

      field :generated_time, -> { String }, optional: false, nullable: false

      field :days_requested, -> { Integer }, optional: false, nullable: false

      field :items, -> { Internal::Types::Array[Plaid::Types::CreditBankEmploymentItem] }, optional: false, nullable: false

      field :warnings, -> { Internal::Types::Array[Plaid::Types::CreditBankEmploymentWarning] }, optional: false, nullable: false
    end
  end
end
