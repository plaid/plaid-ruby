# frozen_string_literal: true

module Plaid
  module Transfer
    module Refund
      module Types
        class TransferRefundCancelRequest < Internal::Types::Model
          field :refund_id, -> { String }, optional: false, nullable: false
        end
      end
    end
  end
end
