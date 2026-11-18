# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferAchNetwork
      extend Plaid::Internal::Types::Enum

      ACH = "ach"
      SAME_DAY_ACH = "same-day-ach"
    end
  end
end
