# frozen_string_literal: true

module Plaid
  module BankTransfer
    module Sweep
      module Types
        class BankTransferSweepGetRequest < Internal::Types::Model
          field :sweep_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
