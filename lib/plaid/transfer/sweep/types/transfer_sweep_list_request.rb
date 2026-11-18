# frozen_string_literal: true

module Plaid
  module Transfer
    module Sweep
      module Types
        class TransferSweepListRequest < Internal::Types::Model
          field :start_date, -> { String }, optional: true, nullable: true

          field :end_date, -> { String }, optional: true, nullable: true

          field :count, -> { Integer }, optional: true, nullable: true

          field :offset, -> { Integer }, optional: true, nullable: false

          field :amount, -> { String }, optional: true, nullable: true

          field :status, -> { Plaid::Types::SweepStatus }, optional: true, nullable: true

          field :originator_client_id, -> { String }, optional: true, nullable: true

          field :funding_account_id, -> { String }, optional: true, nullable: true

          field :transfer_id, -> { String }, optional: true, nullable: true

          field :trigger, -> { Plaid::Types::SweepTrigger }, optional: true, nullable: true
        end
      end
    end
  end
end
