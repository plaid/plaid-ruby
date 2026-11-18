# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    # Data about military info in the income verification precheck.
    class IncomeVerificationPrecheckMilitaryInfo < Internal::Types::Model
      field :is_active_duty, -> { Internal::Types::Boolean }, optional: true, nullable: true

      field :branch, -> { String }, optional: true, nullable: true
    end
  end
end
