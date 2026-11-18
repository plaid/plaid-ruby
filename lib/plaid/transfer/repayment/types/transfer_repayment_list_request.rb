# frozen_string_literal: true

module Plaid
  module Transfer
    module Repayment
      module Types
        class TransferRepaymentListRequest < Internal::Types::Model
          field :start_date, -> { String }, optional: true, nullable: true

          field :end_date, -> { String }, optional: true, nullable: true

          field :count, -> { Integer }, optional: true, nullable: true

          field :offset, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
