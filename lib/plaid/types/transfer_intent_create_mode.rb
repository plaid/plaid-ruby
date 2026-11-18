# frozen_string_literal: true

require_relative "../../plaid"

module Plaid
  module Types
    module TransferIntentCreateMode
      extend Plaid::Internal::Types::Enum

      PAYMENT = "PAYMENT"
      DISBURSEMENT = "DISBURSEMENT"
    end
  end
end
