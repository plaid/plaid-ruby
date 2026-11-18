# frozen_string_literal: true

module Plaid
  module Transfer
    module Recurring
      module Types
        class TransferRecurringListRequest < Internal::Types::Model
          field :start_time, -> { String }, optional: true, nullable: true

          field :end_time, -> { String }, optional: true, nullable: true

          field :count, -> { Integer }, optional: true, nullable: false

          field :offset, -> { Integer }, optional: true, nullable: false

          field :funding_account_id, -> { String }, optional: true, nullable: true
        end
      end
    end
  end
end
