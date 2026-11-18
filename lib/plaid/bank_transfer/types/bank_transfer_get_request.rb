# frozen_string_literal: true

module Plaid
  module BankTransfer
    module Types
      class BankTransferGetRequest < Internal::Types::Model
        field :bank_transfer_id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
