# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module PaymentScheduleInterval
      extend Plaid::Internal::Types::Enum

      WEEKLY = "WEEKLY"
      MONTHLY = "MONTHLY"
    end
  end
end
