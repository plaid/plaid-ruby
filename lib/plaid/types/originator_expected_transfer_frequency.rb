# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module OriginatorExpectedTransferFrequency
      extend Plaid::Internal::Types::Enum

      ONCE_PER_MONTH = "once_per_month"
      TWICE_PER_MONTH = "twice_per_month"
      ONCE_PER_WEEK = "once_per_week"
      DAILY = "daily"
    end
  end
end
