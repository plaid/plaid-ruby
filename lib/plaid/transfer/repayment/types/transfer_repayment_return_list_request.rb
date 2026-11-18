# frozen_string_literal: true

module Plaid
  module Transfer
    module Repayment
      module Types
        class TransferRepaymentReturnListRequest < Internal::Types::Model
          field :repayment_id, -> { String }, optional: false, nullable: false

          field :count, -> { Integer }, optional: true, nullable: true

          field :offset, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
