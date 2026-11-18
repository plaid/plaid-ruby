# frozen_string_literal: true

module Plaid
  module Transfer
    module Recurring
      module Types
        class TransferRecurringCancelRequest < Internal::Types::Model
          field :recurring_transfer_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
