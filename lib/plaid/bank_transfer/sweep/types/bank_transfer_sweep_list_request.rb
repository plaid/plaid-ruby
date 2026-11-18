# frozen_string_literal: true

module Plaid
  module BankTransfer
    module Sweep
      module Types
        class BankTransferSweepListRequest < Internal::Types::Model
          field :origination_account_id, -> { String }, optional: true, nullable: true

          field :start_time, -> { String }, optional: true, nullable: true

          field :end_time, -> { String }, optional: true, nullable: true

          field :count, -> { Integer }, optional: true, nullable: true
        end
      end
    end
  end
end
