# frozen_string_literal: true

module Plaid
  module BankTransfer
    module Event
      module Types
        class BankTransferEventSyncRequest < Internal::Types::Model
          field :after_id, -> { Integer }, optional: false, nullable: false

          field :count, -> { Integer }, optional: true, nullable: true
        end
      end
    end
  end
end
