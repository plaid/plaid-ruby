# frozen_string_literal: true

module Plaid
  module BankTransfer
    module Balance
      module Types
        class BankTransferBalanceGetRequest < Internal::Types::Model
          field :origination_account_id, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
