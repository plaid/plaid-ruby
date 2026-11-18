# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # An object representing an Income Report within the Home Lending Report.
    class CraVerificationIncomeReport < Internal::Types::Model
      field :generated_time, -> { String }, optional: false, nullable: false

      field :days_requested, -> { Integer }, optional: false, nullable: false

      field :user_summary, -> { Plaid::Types::CraVerificationIncomeUserSummary }, optional: false, nullable: true

      field :income_streams, -> { Internal::Types::Array[Plaid::Types::CraVerificationIncomeStream] }, optional: false, nullable: false

      field :items, -> { Internal::Types::Array[Plaid::Types::CraVerificationIncomeItem] }, optional: false, nullable: false
    end
  end
end
