# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferScheduleIntervalUnit
      extend Plaid::Internal::Types::Enum

      WEEK = "week"
      MONTH = "month"
    end
  end
end
