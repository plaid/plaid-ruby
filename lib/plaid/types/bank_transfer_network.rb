# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module BankTransferNetwork
      extend Plaid::Internal::Types::Enum

      ACH = "ach"
      SAME_DAY_ACH = "same-day-ach"
      WIRE = "wire"
    end
  end
end
