# frozen_string_literal: true

module Plaid
  module Transfer
    module Balance
      module Types
        class TransferBalanceGetRequest < Internal::Types::Model
          field :originator_client_id, -> { String }, optional: true, nullable: true

          field :type, -> { Plaid::Types::TransferBalanceType }, optional: true, nullable: false
        end
      end
    end
  end
end
